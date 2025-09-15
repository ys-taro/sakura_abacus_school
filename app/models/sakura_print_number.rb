class SakuraPrintNumber < ApplicationRecord
  has_many :sakura_print, dependent: :destroy
  validates :number, presence: true, uniqueness: true
end
