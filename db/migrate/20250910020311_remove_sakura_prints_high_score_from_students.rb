class RemoveSakuraPrintsHighScoreFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :sakura_prints_high_score, :integer
  end
end
