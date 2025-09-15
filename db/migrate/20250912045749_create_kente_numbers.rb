class CreateKenteNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :kente_numbers do |t|
      t.integer :number, null: false
      t.timestamps null: false
    end

    add_index :kente_numbers, :number, unique: true
  end
end
