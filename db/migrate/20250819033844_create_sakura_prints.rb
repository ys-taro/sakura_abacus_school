class CreateSakuraPrints < ActiveRecord::Migration[6.1]
  def change
    create_table :sakura_prints do |t|
      t.references :student, null: false, foreign_key: true, index: true
      t.integer :print_number, null: false, index: true
      t.integer :multiplication_score, null: false
      t.integer :division_score, null: false
      t.integer :mitori_score, null: false
      t.integer :mitori_anzan_score, null: false
      t.timestamps
    end
  end
end
