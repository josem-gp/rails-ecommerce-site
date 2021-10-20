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

files = [file, file1, file2, file3, file4, file5, file6, file7, file8, file9, file10, file11, file12, file13, file14, file15, file16, file17, file18, file19, file20, file21, file22, file23, file24, file25, file26, file27, file28, file29, file30, file31, file32, file33, file34, file35]

12.times do
    product = Product.new(
        name: Faker::Tea.variety, 
        description: Faker::Lorem.sentence(word_count: 20), 
        price: rand(2000...10000), 
        rating: rand(0..5),
        availability: rand(1..2)
    )
    product.user = admin

    files.sample(3).each do |file|
        product.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
        files.delete(file)
    end
    product.save!
    puts "Product done!"
end


puts "Fake products created!"
puts "Seeding done!"