# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Listing.destroy_all
l1 = Listing.new
l1.start_time = Time.now
l1.start_price = 100
l1.end_price = 100
l1.save
l2 = Listing.new
l2.start_time = Time.now + 300
l2.start_price = 100
l2.end_price = 100
l2.save
l3 = Listing.new
l3.start_time = Time.now + 3000
l3.start_price = 100
l3.end_price = 100
l3.save