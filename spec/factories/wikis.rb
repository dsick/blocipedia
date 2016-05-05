FactoryGirl.define do
  factory :wiki do
    title {Faker::Lorem.words}
    body {Faker::Lorem.paragraph}
    private false
    user 
  end
end
