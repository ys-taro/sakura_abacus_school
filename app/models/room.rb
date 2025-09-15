class Room < ApplicationRecord
  belongs_to :admin
  belongs_to :student

  has_many :messages, dependent: :destroy
end
