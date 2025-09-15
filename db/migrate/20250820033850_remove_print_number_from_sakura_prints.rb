class RemovePrintNumberFromSakuraPrints < ActiveRecord::Migration[6.1]
  def change
    remove_column :sakura_prints, :print_number, :integer
  end
end
