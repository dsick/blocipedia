
#Create Users

# Create an premium user
standard = User.create!(
  username: 'dsick',
  email:    'sick@davesick.net',
  password: 'password',
  password_confirmation: 'password',
  role: 'premium',
  confirmed_at: Time.now
)

# Create an standard user
premium = User.create!(
  username: 'dave',
  email:    'dave@davesick.net',
  password: 'password',
  password_confirmation: 'password',
  role: 'standard',
  confirmed_at: Time.now
)

# Create an admin user
premium = User.create!(
  username: 'davesick',
  email:    'davesick@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: 'admin',
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

Wiki.create!(
title: 'Public Test Wiki',
body: Faker::Lorem.paragraph,
private: false,
user_id: 1
)

Wiki.create!(
title: 'Private Test Wiki',
body: Faker::Lorem.paragraph,
private: true,
user_id: 1
)


15.times do
  Wiki.create!(
    title: Faker::Lorem.sentence.titleize,
    body: Faker::Lorem.paragraph,
    private: [false, true].sample,
    user: users.sample
  )
end
wikis = Wiki.all

# Collaborators Wikis
3.times do
  Collaborator.create!(
    wiki_id: 1,
    user_id: [4,5,6,7].sample
  )
end

3.times do
  Collaborator.create!(
    wiki_id: 2,
    user_id: [4,5,6,7].sample
  )
end
collaborators = Collaborator.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{Collaborator.count} collaborators created"
