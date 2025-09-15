class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :room, null: false, foreign_key: true
      t.string :sender_type
      t.integer :sender_id
      t.text :content

      t.timestamps
    end
  end
end
