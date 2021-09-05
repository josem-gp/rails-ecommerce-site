# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
require "open-uri"

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

puts "Deleting favorites"

Favorite.delete_all

puts "Creating users"

admin = User.create!(username: "josegp_admin", email: "jose-sevilla91@hotmail.es", password: "!Admin241%")
user1 = User.create!(username: "saki_test", email: "saki@hotmail.com", password: "1234567")
user2 = User.create!(username: "allan_test", email: "allan@hotmail.com", password: "1234567")

puts "Admin user created!"

puts "Creating database of Fake products"

file = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file1 = URI.open('https://www.gardeniapharmacy.com/wp-content/uploads/2021/02/coffee.jpg')
file2 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file3 = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file4 = URI.open('https://www.gardeniapharmacy.com/wp-content/uploads/2021/02/coffee.jpg')
file5 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')
file6= URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file7 = URI.open('https://www.gardeniapharmacy.com/wp-content/uploads/2021/02/coffee.jpg')
file8 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')

files = [file, file1, file2, file3, file4, file5, file6, file7, file8]

3.times do
    product = Product.new(
        name: Faker::Tea.variety, 
        description: Faker::Lorem.sentence(word_count: 20), 
        price: rand(2000...10000), 
        rating: rand(1..5), 
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