class CreateSakuraPrintNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :sakura_print_numbers do |t|
      t.integer :number, null: false
      t.timestamps
    end
    add_index :sakura_print_numbers, :number, unique: true
  end
end
