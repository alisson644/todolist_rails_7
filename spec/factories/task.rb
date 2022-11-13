FactoryBot.define do
  factory :task do
    title { Faker::Book.title }
    body { Faker::Lorem.paragraphs }
    completed { false }
    user { FactoryBot.create(:user) }
  end
end