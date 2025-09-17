class DropMessagesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :messages, if_exists: true
  end
end
