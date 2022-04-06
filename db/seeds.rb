# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
require "open-uri"

puts "Deleting all Newsletter"

Newsletter.delete_all

puts "Deleting all Fake OrderItems"

OrderItem.delete_all

puts "Deleting all Fake Orders"

Order.delete_all

puts "Deleting all Test reviews"

Review.delete_all

puts "Deleting all Fake products"

Product.delete_all

puts "Deleting users"

User.delete_all

puts "Deleting all Icons"

Icon.delete_all

puts "Deleting favorites"

Favorite.delete_all

puts "Creating Icons"

default_icon = Icon::IMAGES[0]
icons = Icon::IMAGES[1..-1]

Icon.create!(name: "default_icon", url: default_icon)

icons.each_with_index do |icon, idx|
  Icon.create!(name: "icon#{idx}", url: icon)
end


puts "Creating users"

admin = User.create!(username: "josegp_admin", email: "jose-sevilla91@hotmail.es", password: "1234567", admin: true)
# user1 = User.create!(username: "saki_test", email: "saki@hotmail.com", password: "1234567")
# user2 = User.create!(username: "allan_test", email: "allan@hotmail.com", password: "1234567")

puts "Admin user created!"

puts "Creating database of Fake products"

file = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file1 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file2 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file3 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file4 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file5 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file6= URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file7 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file8 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file9 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file10 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file11 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file12 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file13 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file14 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file15 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file16 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file17 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file18 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file19 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file20 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file21 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file22 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file23 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file24 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file25 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file26 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file27 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file28 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file29 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file30 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file31 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file32 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file33 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file34 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/800px-Cappuccino_at_Sightglass_Coffee.jpg')
file35 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')

products = [
    product_1 = {
        name: "Test_product_1",
        files: [ file, file1, file2],
        stripe_price_id: "price_1KlKNKGsOm5WfgBc2WF4WCS5",
        price: 1000
    },
    product_2 = {
        name: "Test_product_2",
        files: [file3, file4, file5],
        stripe_price_id: "price_1KlKNsGsOm5WfgBcgY8ktTt6",
        price: 1500
    },
    product_3 = {
        name: "Test_product_3",
        files: [file6, file7, file8],
        stripe_price_id: "price_1KlKOJGsOm5WfgBclFPSyCkR",
        price: 2000
    },
    product_4 = {
        name: "Test_product_4",
        files: [file9, file10, file11],
        stripe_price_id: "price_1KlKOrGsOm5WfgBc2JIgEka3",
        price: 2500
    },
    product_5 = {
        name: "Test_product_5",
        files: [file12, file13, file14],
        stripe_price_id: "price_1KlKP9GsOm5WfgBcn87AwzEz",
        price: 3000
    },
    product_6 = {
        name: "Test_product_6",
        files: [file15, file16, file17],
        stripe_price_id: "price_1KlKPYGsOm5WfgBc1KC8tZFz",
        price: 3500
    },
    product_7 = {
        name: "Test_product_7",
        files: [file18, file19, file20],
        stripe_price_id: "price_1KlKPtGsOm5WfgBcIiQTarmJ",
        price: 4000
    },
    product_8 = {
        name: "Test_product_8",
        files: [file21, file22, file23],
        stripe_price_id: "price_1KlKQDGsOm5WfgBccVVT7wl4",
        price: 4500
    },
    product_9 = {
        name: "Test_product_9",
        files: [file24, file25, file26],
        stripe_price_id: "price_1KlKQXGsOm5WfgBcuhr3aC0S",
        price: 5000
    },
    product_10 = {
        name: "Test_product_10",
        files: [file27, file28, file29],
        stripe_price_id: "price_1KlKQvGsOm5WfgBcH8nOWIeg",
        price: 5500
    },
    product_11 = {
        name: "Test_product_11",
        files: [file30, file31, file32],
        stripe_price_id: "price_1KlKRAGsOm5WfgBcmXh9eJuZ",
        price: 6000
    },
    product_12 = {
        name: "Test_product_12",
        files: [file33, file34, file35],
        stripe_price_id: "price_1KlKRWGsOm5WfgBcmzKfztxl",
        price: 6500
    }
]

products.each do |product_hash|
    product = Product.new(
        name: product_hash[:name], 
        description: Faker::Lorem.sentence(word_count: 20), 
        price: product_hash[:price], 
        rating: rand(0..5),
        availability: rand(1..2),
        stripe_price_id: product_hash[:stripe_price_id]
    )
    product.user = admin

    product_hash[:files].each do |file|
        product.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
    end
    product.save!
    puts "Product done!"
end


puts "Fake products created!"
puts "Seeding done!"