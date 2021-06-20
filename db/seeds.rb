# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  user = User.create(
    email: Faker::Internet.email,
    name: Faker::Artist.name,
    password: 123456
  )
  rand(0..5).times do
    Post.create(
      title: Faker::Lorem.sentence(word_count: 3), 
      body: Faker::Markdown.random, 
      user: user, 
      premium: [true, false].sample)
  end
end
p "#{User.count} users created"
p "#{Post.count} posts created"
