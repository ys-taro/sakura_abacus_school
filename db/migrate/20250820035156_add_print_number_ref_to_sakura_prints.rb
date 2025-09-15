class AddPrintNumberRefToSakuraPrints < ActiveRecord::Migration[6.1]
  def change
    add_reference :sakura_prints, :sakura_print_number, null: false, foreign_key: true
  end
end
