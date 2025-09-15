class Kente < ApplicationRecord
  before_save :set_total_score

  belongs_to :student
  belongs_to :kente_rank
  belongs_to :kente_number

  private

  def set_total_score
    self.total_score = multiplication_score + division_score + mitori_score
  end
end
