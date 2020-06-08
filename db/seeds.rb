# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ["Kubilay", "Einstein", "Newton", "Tesla", "Edison", "Mendeleyev"]

names.each do |name|
  user = User.create(username: name)
  Opinion.create(author_id: User.last.id, text: "Hi, I am #{user.username}")
end

names.size.times do |index|
  next if index + 1 == 1
  Following.create(follower_id: 1, followed_id: index + 1)
end

names = ["Marie Curie", "Darwin", "Galileo", "Bell", "Aristoteles", "Vera"]

names.each do |name|
  user = User.create(username: name)
  Opinion.create(author_id: User.find_by(username: name).id, text: "Hi, I am #{user.username}")
end

names.size.times do |index|
  next if index + 7 == 12
  Following.create(follower_id: 12, followed_id: index + 7)
end
