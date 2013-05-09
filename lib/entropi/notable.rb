module Entropi
  module Notable
    extend ActiveSupport::Concern

    included do
      has_many :notes, as: :notable, dependent: :destroy, class_name: "Entropi::Note"

      # Retrieves notes by order submitted
      def notes_chronologically
        notes.in_order
      end

      # Adds a note to the object
      def add_note(note)
        notes << note
      end
    end

    # Class Method that returns the name of the class
    def self.notable
      self.base_class.name
    end

    # Class Method that finds notes for a specific instance of an object
    def self.find_notes_for(obj)
      Entropi::Note.find_notes_for_notable(notable, obj.id)
    end

    # Find notes for this object by user
    def self.find_notes_by_user(user)
      Entropi::Note.find_notes_by_user(user).where(notable_type: notable)
    end

  end
end