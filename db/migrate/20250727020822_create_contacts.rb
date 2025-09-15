class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.text :text
      t.string :email
      t.string :phone_number
      t.string :contact_type

      t.timestamps
    end
  end
end
