module SimpleTag
  class Tag < ActiveRecord::Base
    has_many :taggings, :dependent => :destroy, :class_name => 'SimpleTag::Tagging'
    attr_accessible :name

    validates_presence_of :name
    validates_uniqueness_of :name
  end
end