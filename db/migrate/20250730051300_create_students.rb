class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
        t.references :master_account, null: false, foreign_key: true

        t.string :last_name
        t.string :first_name
        t.string :last_name_kana
        t.string :first_name_kana
        t.string :rank
        t.boolean :is_active

      t.timestamps
    end
  end
end
