# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# # Add Users
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

# # Add four posts
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'This is my second post!', text: 'Second comment')
third_post = Post.create(author: second_user, title: 'Hello everyone!', text: 'I am new on this')
fourth_post = Post.create(author: second_user, title: 'Microverse', text: 'This is very cool')

# Add 6 comments into the posts
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: first_user, text: 'Hi Lilly, How was your day?')
Comment.create(post: first_post, author: second_user, text: 'I am very well, thank you')
Comment.create(post: second_post, author: second_user, text: 'Congrats for your second post')
Comment.create(post: third_post, author: first_user, text: 'Welcome to my new blog!')
Comment.create(post: fourth_post, author: first_user, text: 'You are right, it is very cool')