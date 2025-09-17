class AddDefaultToNextKenteRankIdInStudents2 < ActiveRecord::Migration[6.1]
  def change
    change_column_default :students, :next_kente_rank_id, 2
  end
end
