# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

puts "Deleting all Fake products"

Product.destroy_all

puts "Deleting Admin user"

User.find_by(username: "josegp_admin").delete

puts "Creating Admin user"

admin = User.create!(username: "josegp_admin", email: "jose-sevilla91@hotmail.es", password: "!Admin241%")

puts "Admin user created!"

puts "Creating database of Fake products"

30.times do
    product = Product.new(
        name: Faker::Tea.variety, 
        description: Faker::Lorem.sentence(word_count: 20), 
        price: rand(2000...10000), 
        rating: rand(1..5), 
    )
    product.user = admin

    product.save!
end


puts "Fake products created!"
puts "Seeding done!"