# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
 require 'faker'

puts "Cleaning up database..."
Surfboard.destroy_all
puts "Database cleaned"

surfboard1 = Restaurant.new(
board_type: 'Gnarly long-board in salmon-pink',
description: 'Totally rad board for ripping the phattest breaks on',
address: "Bali, Indonesia",
user_id: 1
)
require "open-uri"
file = URI.open('https://res.cloudinary.com/dh6gdchfj/image/upload/v1606940861/dishoom-cg_ggahzz.jpg')
surfboard1.photo.attach(io: file, filename: 'dishoom-ken.png', content_type: 'image/jpg')
surfboard1.save!
puts 'Created surfboard1'
