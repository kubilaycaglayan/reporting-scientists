# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = {"Kubilay" =>
        ["https://kubilaycaglayan.com/images/photo.jpg",
          "https://www.muralswallpaper.com/app/uploads/scientific-chalkboard-childrens-plain-820x532.jpg",
          "Hi! I am Kubilay, I am microverse student!", "Kubilay Çağlayan"],
  "Einstein" =>
  ["https://lean.org.tr/wp-content/uploads/2017/11/einstain-mutluluk-formulu.jpg",
    "https://miro.medium.com/max/830/1*uOqm9PAE6o6nt_bGLliPvA.png",
    "Hello, Einstein here. Relative to whom? heheh", "Albert Einstein"],
  "Newton" =>
  ["https://www.biography.com/.image/t_share/MTY2MzU3Njc4ODI0NjI5OTM0/isaac_newton_1689_painting_sir_godfrey_kneller_public_domain_via_wikimedia_commons.jpg",
    "https://image.sciencenordic.com/1453753.jpg?imageId=1453753&width=1058&height=604",
    "I am popular...", "Isaac Newton"],
  "Tesla" => ["https://upload.wikimedia.org/wikipedia/commons/d/d4/N.Tesla.JPG",
    "https://www.dhresource.com/0x0/f2/albu/g9/M01/C4/AB/rBVaVVv-VV-AFnGzAAPon3d2Eiw587.jpg",
    "Where is my wireless charger?", "Nicola Tesla"],
  "Edison" => ["https://lh3.googleusercontent.com/proxy/Sh0WWo3jY7wR3jJ6_bLw23itkLD0KQFM__MJl-e6xZOxdiBvENdJKlQd1a67ZB-vurgPIofnpcMQaL3yyLxCAIK78OZbfLl2RR_AXhhEwVsjgxoHF6K6pq25Om7N3LaNqSU8Idfgb5VhQl4q4_O47Q8F50NIUeGwN_xTHbC1VFxggxdmvBVxzO5Kudg",
    "https://pazarlamasyon.com/wp-content/uploads/2018/08/Thomas-Edison.jpg",
    "Let me enlighten you in this one...", "Thomas Edison"],
  "Mendeleyev" => ["https://lh3.googleusercontent.com/proxy/1lstB1BtoId-f4QrAo6qlCQ1d1B5HGAg-CuhWVHUIYkANtp0IBSsRSQF4gbCH-QUpxVKzZEeEHsYWIgPHDtQrlyzz5s2PkJFdcJofnO1DFZfQXj4Lvutg0SYerTE9GBDQ3neOJkAZ-yVRmSTqxoNTFbxdDdgIw12aX2JOZXSyTVRn30IJyc",
    "https://i.pinimg.com/originals/80/5d/e6/805de67480b378730e02f64542c1a3c4.png",
    "I know, what I don't know.", "Dmitriy Mendeleyev"]
}

names.each do |name, info|
  user = User.create(username: name, fullname: info[3])
  Opinion.create(author_id: User.last.id, text: info[2])
  photo = Photo.new(user_id: user.id, image_type: 'profile')
  photo.image = URI.parse(info[0])
  photo.save
  photo = Photo.new(user_id: user.id, image_type: 'cover')
  photo.image = URI.parse(info[1])
  photo.save
end

names.size.times do |index|
  next if index + 1 == 1
  Following.create(follower_id: 1, followed_id: index + 1)
end

names = ["Marie Curie", "Darwin", "Galileo", "Bell", "Aristoteles", "Vera"]

names.each do |name|
  user = User.create(username: name)
  Opinion.create(author_id: User.find_by(username: name).id, text: "Hi, I am #{user.username}")
  photo = Photo.new(user_id: user.id, image_type: 'profile')
  photo.image = URI.parse("https://cdn.iconscout.com/icon/free/png-512/avatar-372-456324.png")
  photo.save
  photo = Photo.new(user_id: user.id, image_type: 'cover')
  photo.image = URI.parse("https://ak.picdn.net/shutterstock/videos/12243746/thumb/1.jpg")
  photo.save
end

names.size.times do |index|
  next if index + 7 == 12
  Following.create(follower_id: 12, followed_id: index + 7)
end

["Hello!", "How are you guys?", "let's have some fun!", "Please follow my lead", "Is there anything you want to add?", "Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey Hey "]. each do |tweet|
  Opinion.create(author_id: 1, text: tweet)
  Opinion.create(author_id: 2, text: tweet)
end

User.all.each do |user|
  next if user.id == 1 || user.id == 2
  Following.create(follower_id: user.id, followed_id: 2)
end
