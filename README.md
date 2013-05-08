# entropi_notable

entropi_notable is a Ruby on Rails plugin that allows developers to easily add notes to models through a ActiveSupport::Concern

## Usage

Add the following to your Gemfile and bundle

    gem 'entropi_notable', github: 'entropillc/notable'

Once bundled, you will need to install the migrations

    rake entropi_notable_engine:install:migrations
    rake db:migrate

You are now ready to start using notable.

Below is an example of how you would add notes to a model

    class Employee < ActiveRecord::Base
      include Entropi::Notable
    end

## Modifying 

You can modify the base Note model by creating a note_decorator.rb class in apps/models/entropi. The below example will show you how to add functionality to the Note model using class_eval

    Entropi::Note.class_eval do
      # This adds a relationship to an organization Model
      belongs_to :organization

      # Validates the presence of an organization
      validates :organization, presence: true

      class << self
        # This finds all notes for a given Organization
        def find_notes_by_organization(org)
          self.where(organization_id: org.id)
        end
      end
    end



