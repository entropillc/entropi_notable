class Entropi::Note < ActiveRecord::Base
  extend Entropi

  attr_accessible :body, :notable_id, :notable_type, :title, :user_id

  # Relationships
  belongs_to :notable, polymorphic: true
  belongs_to :user

  # Model Validations
  validates :title, length: { maximum: 100 }
  validates :body, presence: true
  validates :user_id, presence: true
  validates :notable_id, presence: true
  validates :notable_type, presence: true

  scope :in_order, order('created_at ASC')
  scope :latest, order('created_at DESC')

  # Override the all method so that the default scope is in
  # chronological order
  def all
    self.in_order
  end

  class << self
    #  Method to lookup all notes assigned 
    # to all notable types for a given user
    def find_notes_by_user(user) 
      where(user_id: user.id).latest
    end

    # Method to look up all notes for 
    # a notable class name and notable id
    def find_notes_for_notable(notable_str, notable_id)
      where(notable_type: notable_str, notable_id: notable_id)
    end

  end

end
