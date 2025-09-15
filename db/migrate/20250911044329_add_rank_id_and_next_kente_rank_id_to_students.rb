class AddRankIdAndNextKenteRankIdToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :rank_id, :integer
    add_column :students, :next_kente_rank_id, :integer

    # 外部キー制約を追加 (KenteRankモデルがある場合)
    add_foreign_key :students, :kente_ranks, column: :rank_id
    add_foreign_key :students, :kente_ranks, column: :next_kente_rank_id

    # インデックス追加（検索性能向上）
    add_index :students, :rank_id
    add_index :students, :next_kente_rank_id
  end
end
