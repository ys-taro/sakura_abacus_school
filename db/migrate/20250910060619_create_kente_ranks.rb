class CreateKenteRanks < ActiveRecord::Migration[6.1]
  def change
    create_table :kente_ranks do |t|
      t.string :rank
      t.integer :passing_score

      t.timestamps
    end
  end
end
