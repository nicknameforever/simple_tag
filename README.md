# SimpleTag

Lightweight tagging for Rails 3.

## Installation

In your Gemfile:

    gem 'simple_tag'

At the command line:

    $ bundle install

Do migration:

    rails generate simple_tag:migration
    rake db:migrate

## Usage

In your model:

    is_taggable

Make tags:

    obj.add_tags(["tag1", "tag2"])
    obj.add_tags("tag3")

Delete tags:

    obj.remove_tags(["tag1", "tag2"])
    obj.remove_tags("tag3")
    
Find tagged items:

    TaggableModel.tagged_with(["tag1", "tag2"])
    TaggableModel.tagged_with("tag3")

