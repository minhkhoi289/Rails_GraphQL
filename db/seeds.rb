# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

post1 = Post.create!(
  title: "Getting Started with GraphQL",
  body: "GraphQL is a query language for APIs and a runtime for fulfilling those queries with your existing data...",
  status: "published",
  likes_count: 15
)

post2 = Post.create!(
  title: "Draft: Advanced GraphQL Techniques",
  body: "This post will cover advanced topics like fragments, directives, and subscriptions...",
  status: "draft",
  likes_count: 0
)

post3 = Post.create!(
  title: "Legacy: REST vs GraphQL",
  body: "A comparison of traditional REST APIs with modern GraphQL approaches...",
  status: "archived",
  likes_count: 42
)

# Create comments for the published post
puts "Creating comments..."

Comment.create!(
  [
    {
      content: "Great introduction to GraphQL!",
      post: post1
    },
    {
      content: "This helped me understand the basics.",
      post: post1
    },
    {
      content: "Looking forward to the next part!",
      post: post1
    }
  ]
)

puts "Seed data created successfully!"
puts "Created #{Post.count} posts and #{Comment.count} comments"
