# This file should contain all the record creation needed to seed the database with default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

# Clear existing data
puts "Clearing existing data..."
Like.delete_all
Comment.delete_all
Post.all.each { |post| post.labels.clear } # Remove associations
Post.delete_all
Label.delete_all
Administrator.delete_all

puts 'Creating admin user...'
Administrator.create!(
  name: 'admin',
  password: 'password'
)

puts 'Creating labels...'
labels = [
  'Technology',
  'Programming',
  'Ruby on Rails',
  'Web Development',
  'Software Engineering'
].map do |name|
  Label.create!(name: name)
end

puts 'Creating blog posts...'
posts = 10.times.map do |i|
  post = Post.create!(
    title: Faker::Lorem.unique.sentence(word_count: 5),
    content: "## #{Faker::Lorem.sentence}\n\n" +
             Faker::Markdown.random +
             "\n\n### #{Faker::Lorem.sentence}\n\n" +
             Faker::Lorem.paragraphs(number: 3).join("\n\n") +
             "\n\n```ruby\n" +
             "class Example\n  def test\n    puts 'Hello World'\n  end\nend\n" +
             "```\n\n" +
             Faker::Lorem.paragraphs(number: 2).join("\n\n"),
    created_at: Faker::Date.between(from: 1.year.ago, to: Date.today),
    visited_count: 0
  )
  
  # Associate 1-3 random labels with each post
  post.labels << labels.sample(rand(1..3))
  post
end

puts 'Creating comments...'
15.times do
  post = posts.sample
  Comment.create!(
    post: post,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 3),
    created_at: Faker::Time.between(from: post.created_at, to: Date.today)
  )
end

puts 'Creating likes...'
20.times do
  Like.create!(
    post: posts.sample
  )
end

# Reset visit counters for all posts
puts 'Resetting post visit counters...'
Post.update_all(visited_count: 0)

puts 'Seed data created successfully!'