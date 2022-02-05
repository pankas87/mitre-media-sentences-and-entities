# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sentences = [
  {
    sentence: "Apple is looking at buying U.K. startup for $1 billion.",
    entities: [{ text: "Apple", type_of: "ORG" },
               { text: "U.K.", type_of: "GPE" },
               { text: "$1 billion", type_of: "MONEY" }]
  },
  {
    sentence: "Regional funds with exposure to United States and outperform equity market over 3 year",
    entities: [{ text: "Regional funds", type_of: "THEME" },
               { text: "United States", type_of: "GPE" },
               { text: "equity market", type_of: "THEME" },
               { text: "3 year", type_of: "TIME" }]
  }
]

sentences.each do |s|
  sentence = Sentence.new text: s[:sentence]
  sentence.entities = s[:entities].map { |e| Entity.new text: e[:text], type_of: e[:type_of] }
  sentence.save
end