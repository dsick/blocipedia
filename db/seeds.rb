
#Create Users

# Create an standard user
dave = User.create!(
  username: 'dsick',
  email:    'sick@davesick.net',
  password: 'password',
  password_confirmation: 'password',
  confirmed_at: Time.now
)

5.times do
  User.create!(
    username: Faker::Internet.user_name,
    email:    Faker::Internet.email,
    password: "testtest",
    password_confirmation: "testtest",
    confirmed_at: Time.now
  )
end
users = User.all

# Create Wikis
15.times do
  Wiki.create!(
    title: Faker::Lorem.sentence.titleize,
    body: Faker::Lorem.paragraph,
    private: [false, true].sample,
    user: users.sample
  )
end
wikis = Wiki.all



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
