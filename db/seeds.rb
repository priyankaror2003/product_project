# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
#  name             :string(255)
#  model            :string(255)
#  brand            :string(255)
#  year             :string(255)
#  ram              :string(255)
#  external_storage :string(255)

5000.times do
  name = Faker::Company.name
  model = Faker::Device.model_name
  brand = Faker::Device.manufacturer
  year = (1900 + rand(81)).to_s
  ram =  rand(1..64)
  external_storage =   rand(500..5000)
  Product.create(name: name,model: model, brand: brand, year: year, ram: ram, external_storage: external_storage)

end

User.create(email:"test@gmail.com",password:"password")
