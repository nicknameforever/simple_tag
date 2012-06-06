module SimpleTag
  module Taggable
    def is_taggable
      class_eval do
        has_many :taggings, :as => :taggable, :dependent => :destroy, :class_name => "SimpleTag::Tagging"
        has_many :tags, :through => :taggings, :class_name => "SimpleTag::Tag"

        include InstanceMethods
        
        def self.tagged_with(names)
          names = format_tag_names(names)  
          if names.blank?
            return []
          end
          query_tag_ids = Tag.where(:name => names).map {|t| t.id }
          query_tag_count = query_tag_ids.length
          taggable_ids = joins(:tags).where(:tags => {:id => query_tag_ids}).select("#{table_name}.id").map(&:id)
          taggable_id_count = Hash.new(0)
          taggable_ids.each {|t| taggable_id_count[t] += 1 }
          taggable_id_count.select! {|k,v| v == query_tag_count }
          find(taggable_id_count.keys)      
        end
        
        private   
        
          def self.format_tag_names(names)
            if names.is_a?(String)
              names = [names]
            end  
            if !names.is_a?(Array)
              return nil
            end
            names = names.reject {|n| n.blank? or !n.is_a?(String) }
          end
       
      end
    end
    
    module InstanceMethods
      
      def add_tags(names) 
        names = self.class.format_tag_names(names)  
        if names.blank?
          return []
        end
        new_tags = []
        names.each do |n| 
          new_tags << Tag.find_or_create_by_name(n)
        end
        self.tags += new_tags
      end
      
      def remove_tags(names) 
        names = self.class.format_tag_names(names)  
        if names.blank?
          return []
        end
        rem_tags = []
        names.each do |n| 
          rem_tags << Tag.find_by_name(n)
        end
        self.tags -= rem_tags
      end
       
    end
    
  end
  
end