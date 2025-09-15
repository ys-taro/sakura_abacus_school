class KenteNumber < ApplicationRecord
  has_many :kentes, dependent: :destroy
  has_many :students, through: :kentes
end
