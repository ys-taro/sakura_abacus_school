class CreateKentes < ActiveRecord::Migration[6.1]
  def change
    create_table :kentes do |t|
      t.integer :student_id, null: false
      t.integer :multiplication_score, default: 0, null: false
      t.integer :division_score, default: 0, null: false
      t.integer :mitori_score, default: 0, null: false
      t.integer :total_score, default: 0, null: false
      t.integer :kente_rank_id, null: false
      t.integer :kente_number_id, null: false
      t.timestamps null: false
    end

    add_index :kentes, :student_id
    add_index :kentes, :kente_rank_id
    add_index :kentes, :kente_number_id

    add_foreign_key :kentes, :students
    add_foreign_key :kentes, :kente_ranks
    add_foreign_key :kentes, :kente_numbers
  end
end
