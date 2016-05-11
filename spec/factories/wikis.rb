FactoryGirl.define do
  factory :wiki do
    title {Faker::Lorem.words.join(' ').titleize }
    body {Faker::Lorem.paragraph}
    private false
    user 
  end
end
