class SakuraPrint < ApplicationRecord
  before_save :set_total_score

  belongs_to :student
  belongs_to :sakura_print_number

  private

  def set_total_score
    self.total_score = multiplication_score + division_score + mitori_score + mitori_anzan_score
  end
end
