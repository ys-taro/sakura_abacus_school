class AddSakuraPrintsHighScoreToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :sakura_prints_high_score, :integer, null: false, default: 0
  end
end
