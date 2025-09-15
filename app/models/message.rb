class Message < ApplicationRecord
  belongs_to :room
  belongs_to :sender, polymorphic: true
  
  validates :content, presence: true
end
