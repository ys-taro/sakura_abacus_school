class ChangeRankIdTypeInStudents < ActiveRecord::Migration[6.1]
  def change
    change_column :students, :rank_id, :bigint
    change_column :students, :next_kente_rank_id, :bigint
  end
end
