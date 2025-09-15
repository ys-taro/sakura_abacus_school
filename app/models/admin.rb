class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise authentication_keys: [:email]

  has_many :rooms, dependent: :destroy
  has_many :messages, through: :rooms
  has_many :sent_messages, as: :sender, class_name: 'Message', dependent: :destroy
end
