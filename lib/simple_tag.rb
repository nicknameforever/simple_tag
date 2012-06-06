require "active_record"

require "simple_tag/version"
require "simple_tag/taggable"
require "simple_tag/tagging"
require "simple_tag/tag"

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend SimpleTag::Taggable
end
