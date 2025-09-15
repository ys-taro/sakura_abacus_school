class KenteRank < ApplicationRecord
  has_many :kentes, dependent: :restrict_with_exception
end
