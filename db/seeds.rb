# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
kente_ranks_data = [
  { rank: '16級', passing_score: 90 },
  { rank: '15級', passing_score: 90 },
  { rank: '14級', passing_score: 90 },
  { rank: '13級', passing_score: 90 },
  { rank: '12級', passing_score: 90 },
  { rank: '11級', passing_score: 90 },
  { rank: '10級', passing_score: 90 },
  { rank: '9級', passing_score: 180 },
  { rank: '8級', passing_score: 180 },
  { rank: '7級', passing_score: 180 },
  { rank: '6級', passing_score: 210 },
  { rank: '5級', passing_score: 210 },
  { rank: '4級', passing_score: 210 },
  { rank: '準3級', passing_score: 180 },
  { rank: '3級', passing_score: 240 },
  { rank: '準2級', passing_score: 210 },
  { rank: '2級', passing_score: 240 },
  { rank: '準1級', passing_score: 210 },
  { rank: '1級', passing_score: 240 }
]

kente_ranks_data.each do |data|
  KenteRank.find_or_create_by!(rank: data[:rank]) do |kr|
    kr.passing_score = data[:passing_score]
  end
end

puts "KenteRank table initialized with #{kente_ranks_data.size} records."
