# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = {"kubilay" =>
        ["https://kubilaycaglayan.com/images/photo.jpg",
          "https://www.muralswallpaper.com/app/uploads/scientific-chalkboard-childrens-plain-820x532.jpg",
          "Hi! I am Kubilay, I am a microverse student! I had a lot fun when building this project.", "Kubilay Çağlayan"],
  "relative32" =>
  ["https://foto.haberler.com/haber/2012/11/19/einstein-in-beyni-normal-insanlarin-beyninden-4102213_9814_o.jpg",
    "https://miro.medium.com/max/830/1*uOqm9PAE6o6nt_bGLliPvA.png",
    "Hello, Einstein here. Relative to whom? heheh", "Albert Einstein"],
  "apple" =>
  ["https://www.biography.com/.image/t_share/MTY2MzU3Njc4ODI0NjI5OTM0/isaac_newton_1689_painting_sir_godfrey_kneller_public_domain_via_wikimedia_commons.jpg",
    "https://image.sciencenordic.com/1453753.jpg?imageId=1453753&width=1058&height=604",
    "I am popular...", "Isaac Newton"],
  "thunderbolt" => ["https://upload.wikimedia.org/wikipedia/commons/d/d4/N.Tesla.JPG",
    "https://www.dhresource.com/0x0/f2/albu/g9/M01/C4/AB/rBVaVVv-VV-AFnGzAAPon3d2Eiw587.jpg",
    "Where is my wireless charger?", "Nicola Tesla"],
  "bright!" => ["https://i1.wp.com/bilgikapsulu.com/wp-content/uploads/2017/04/edison-ana.jpg?fit=442%2C452",
    "https://pazarlamasyon.com/wp-content/uploads/2018/08/Thomas-Edison.jpg",
    "Let me enlighten you in this one...", "Thomas Edison"],
  "knowthy" => ["https://media.sciencephoto.com/image/c0135223/800wm",
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

names = {"radi woman" =>
        ["https://gossipdergi.com/wp-content/uploads/2015/03/marie-curie-1.jpg",
          "https://www.bilimseldunya.com/wp-content/uploads/2020/04/Marie-Curie-1867-1934.jpeg",
          "Be careful, I have radiation!", "Marie Curie"],
  "revolate" =>
  ["https://upload.wikimedia.org/wikipedia/commons/4/45/Charles_Darwin_1880.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Evolution-des-wissens.jpg/1024px-Evolution-des-wissens.jpg",
    "Hello and welcome. Very soon Everyone will be awesome. Probably in a million years or something.", "Charles Darwin"],
  "sphere" =>
  ["https://upload.wikimedia.org/wikipedia/commons/c/cc/Galileo.arp.300pix.jpg",
    "https://www.sciencemag.org/sites/default/files/styles/article_main_large/public/ca_0726NID_Stars_online.jpg?itok=UfIqZ7JT",
    "What about a glass of water?", "Galileo Galilei"],
  "alo" => ["https://upload.wikimedia.org/wikipedia/commons/1/10/Alexander_Graham_Bell.jpg",
    "https://miro.medium.com/max/550/0*6ousXT_W132rBQ8e.jpg",
    "Who could image that this could gone that much far! Wow!", "Alexander Graham Bell"],
  "aristo" => ["https://cdn.kidega.com/author/large/0c98cf9fcc2920d1de5015331b69fd74-qCEs6.jpg",
    "https://www.felsefe.gen.tr/wp-content/uploads/2019/11/aristoteles-platon-678x381.jpg",
    "Let me think about that one...", "Aristoteles"],
  "pshycology majest" => ["https://media-exp1.licdn.com/dms/image/C4D03AQHUn0E63WH9bg/profile-displayphoto-shrink_200_200/0?e=1597276800&v=beta&t=cesvYfDZs4nXVpAe0k6e5kLa95HphVtuZPP7-vaIDzY",
    "https://i2.wp.com/psychlearningcurve.org/wp-content/uploads/2019/12/skills.png?fit=1000%2C563",
    "Bunu yapmak için 3 adım yöntemini takip edeceğiz. Bir etrafında 3 güzel şey göstereceksin.", "Vera Çağlayan"]
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
  next if index + 7 == 12
  Following.create(follower_id: 12, followed_id: index + 7)
end

["Hello!", "How are you guys?", "let's have some fun!", "Please follow my lead",
  "Is there anything you want to add?",
  "What part of me wants to put some randomity in the air.",
  "Give me a text that is exactly representing the 140 character limits. Which we had
  back in time when twitter first established. Back in t",
   "Why is it that we don't seem to be able to do somethings"]. each do |tweet|
  Opinion.create(author_id: 1, text: tweet)
  Opinion.create(author_id: 2, text: tweet)
end

User.all.each do |user|
  next if user.id == 1 || user.id == 2
  Following.create(follower_id: user.id, followed_id: 2)
  Following.create(follower_id: user.id, followed_id: 1)
end
