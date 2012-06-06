module SimpleTag
  class Tagging < ::ActiveRecord::Base 

    attr_accessible :tag, :tag_id, :taggable, :taggable_type, :taggable_id

    belongs_to :tag, :class_name => 'SimpleTag::Tag'
    belongs_to :taggable, :polymorphic => true

    validates_presence_of :tag_id
    validates_presence_of :taggable_id
    validates_presence_of :taggable_type

    validates_uniqueness_of :tag_id, :scope => [ :taggable_type, :taggable_id ]
  end
end