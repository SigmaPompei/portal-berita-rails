FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence(word_count: 5) }
    body { Faker::Lorem.paragraph(sentence_count: 5) }
    association :user
    association :category
  end
end