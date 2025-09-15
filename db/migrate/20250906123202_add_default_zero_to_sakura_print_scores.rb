class AddDefaultZeroToSakuraPrintScores < ActiveRecord::Migration[6.1]
  def change
    change_column_default :sakura_prints, :multiplication_score, 0
    change_column_default :sakura_prints, :division_score, 0
    change_column_default :sakura_prints, :mitori_score, 0
    change_column_default :sakura_prints, :mitori_anzan_score, 0
  end
end
