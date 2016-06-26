# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(
    [ { name: "Rustic Steel Salad", quantity: 100, price: 50 },
      { name: "Unbranded Plastic Fish", quantity: 7, price: 300 },
      { name: "Tasty Soft Shoes", quantity: 1, price: 1500 },
      { name: "Gorgeous Metal Shirt", quantity: 3, price: 3500 },
      { name: "Tasty Rubber Soap", quantity: 10, price: 200 },
      { name: "Awesome Frozen Cheese", quantity: 1000, price: 100 },
      { name: "Refined Concrete Soap", quantity: 5, price: 800 },
      { name: "Generic Frozen Chips", quantity: 2, price: 90 },
      { name: "Handmade Concrete Tuna", quantity: 8, price: 500 },
      { name: "Fantastic Granite Bacon", quantity: 2, price: 900 },
      { name: "Refined Plastic Pizza", quantity: 444, price: 700 }
    ])