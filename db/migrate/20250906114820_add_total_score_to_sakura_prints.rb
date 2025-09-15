class AddTotalScoreToSakuraPrints < ActiveRecord::Migration[6.1]
  def change
    add_column :sakura_prints, :total_score, :integer, null: false, default: 0
  end
end
