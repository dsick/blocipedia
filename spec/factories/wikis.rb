FactoryGirl.define do
  factory :wiki do
    title {Faker::Lorem.sentence.titleize}
    body {Faker::Lorem.paragraph}
    private false
    user 
  end
end
