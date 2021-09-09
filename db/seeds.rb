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
    post = Post.create(
      title: Faker::Lorem.sentence(word_count: 5),
      description: Faker::Lorem.sentence(word_count: 15),
      body: Faker::Markdown.sandwich(sentences: 50),
      user: user,
      premium: [true, false].sample)
    rand(0..3).times do
      Comment.create(
        body: Faker::Markdown.sandwich(sentences: 5),
        commentable: post,
        user: user
        )
    end
  end
end

['ruby', 'rails', 'stimulus', 'hotwire', 'javascript', 'api', 'react'].each do |tag|
  Tag.create(name: tag)
end

p "#{User.count} users created"
p "#{Post.count} posts created"
p "#{Comment.count} comments created"
