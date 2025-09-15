class Student < ApplicationRecord
  belongs_to :master_account
  has_many :sakura_prints, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :messages, through: :rooms, dependent: :destroy
  has_many :sent_messages, as: :sender, class_name: 'Message', dependent: :destroy
  has_many :kentes, dependent: :destroy
  has_many :kente_numbers, through: :kentes

  belongs_to :kente_rank, foreign_key: :rank_id, optional: true
  belongs_to :next_kente_rank, class_name: 'KenteRank', foreign_key: :next_kente_rank_id, optional: true
end
