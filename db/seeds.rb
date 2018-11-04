require 'faker'

10.times do User.create!(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    bio: Faker::Community.quotes
)
end

10.times do Gossip.create!(
    anonymous_gossip: Faker::Community.quotes,
    user_id: rand(User.first.id..User.last.id)
)
end