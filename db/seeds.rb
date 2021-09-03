# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
require "open-uri"


puts "Deleting all Test reviews"

Review.delete_all

puts "Deleting all Fake products"

Product.delete_all

puts "Deleting Admin user"

User.find_by(username: "josegp_admin").delete

puts "Creating Admin user"

admin = User.create!(username: "josegp_admin", email: "jose-sevilla91@hotmail.es", password: "!Admin241%")

puts "Admin user created!"

puts "Creating database of Fake products"

file = URI.open('https://cdn.nogarlicnoonions.com/images/thumbs/image.php?width=2000&height=2000&image=/images/articles/2021-07/best-coffee-beans-luxe-digital2021-07-11-10-19-37.jpg')
file1 = URI.open('https://www.gardeniapharmacy.com/wp-content/uploads/2021/02/coffee.jpg')
file2 = URI.open('https://blog.warriorcoffee.com/hubfs/_MG_3386.jpg')

files = [file, file1, file2]

1.times do
    product = Product.new(
        name: Faker::Tea.variety, 
        description: Faker::Lorem.sentence(word_count: 20), 
        price: rand(2000...10000), 
        rating: rand(1..5), 
        availability: rand(1..2)
    )
    product.user = admin

    files.each do |file|
        product.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
    end
    product.save!
end


puts "Fake products created!"
puts "Seeding done!"