# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 15.times do
#   tag_name = Faker::ProgrammingLanguage.name
#   Tag.create(name: tag_name)
# end
# in console 'Rails.application.load_seed'

Comment.delete_all
Tagging.delete_all
Tag.delete_all
Post.delete_all
User.delete_all


TAGS_LIST = [
  "Blogging",
 "Freelancing",
 "How to Succeed",
 "Income Reports",
 "Internet Marketing",
 "Miscellaneous",
 "Quitting Your Job",
 "Social Media",
 "Rails",
 "JavaScript",
 "React",
 "VueJS",
 "WordPress",
 "PHP",
 "Rust",
 "Computing",
 "Neural Network",
 "Python"
]

TAGS_LIST.each { |tag| Tag.find_or_create_by!(name: tag)}
ADMIN_PASSWORD = 'secretus'
admin = User.create!(email: "admin@mail.com", name: "nemov", password: ADMIN_PASSWORD, confirmed_at: Time.zone.now)

6.times do
  email = Faker::Internet.email
  name = Faker::Artist.name
  user = User.create!(
    email: email,
    name: name,
    password: 'password',
    confirmed_at: Time.zone.now
  )
  rand(0..5).times do
    post = Post.create!(
      title: Faker::Lorem.sentence(word_count: 5),
      description: Faker::Lorem.sentence(word_count: 15),
      body: Faker::Markdown.sandwich(sentences: 50),
      user: user,
      # premium: [true, false].sample)
    )
    rand(1..3).times do
      tag_name = Tag.pluck(:name).sample
      post.tags.create(name: tag_name)
    end
    rand(0..7).times do
      Comment.create(
        body: Faker::Markdown.sandwich(sentences: 5),
        commentable: post,
        user: user
        )
    end
  end
end


p "#{User.count} users created (admin: #{admin.email}, password: #{ADMIN_PASSWORD})"
p "#{Post.count} posts created"
p "#{Comment.count} comments created"
p "#{Tag.count} tags created"
