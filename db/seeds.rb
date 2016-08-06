# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


p1 = Post.new(author_id: 1, url: "www.p1.com", title: "title", content: "con-tent")
p2 = Post.new(author_id: 2, url: "www.p2.com", title: "title2", content: "con-tent2")
p3 = Post.new(author_id: 2, url: "www.p3.com", title: "title3", content: "con-tent3")

PostSub.create(post_id: 2, sub_id: 1)
PostSub.create(post_id: 2, sub_id: 2)
PostSub.create(post_id: 2, sub_id: 2)

Sub.create(title: "Apples", description: "appletime", mod_id: 1)
Sub.create(title: "Oranges", description: "orangetime", mod_id: 1)
Sub.create(title: "Bananas", description: "bananatime", mod_id: 2)

User.create(username: "1", password: "password")
User.create(username: "2", password: "password")
User.create(username: "3", password: "password")
