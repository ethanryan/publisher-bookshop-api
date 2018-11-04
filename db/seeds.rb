# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#some bookstores:
Shop.create({name: "Amazon"})
Shop.create({name: "BN.com"})
Shop.create({name: "Strand - NYC"})
Shop.create({name: "McNally Jackson Books - NYC"})
Shop.create({name: "Powell's City of Books - Portland"})

#the Big Five publishers:
Publisher.create({name: "Penguin Random House"})
Publisher.create({name: "Macmillan"})
Publisher.create({name: "Hachette"})
Publisher.create({name: "HarperCollins"})
Publisher.create({name: "Simon & Schuster"})

#some books:
Book.create({title: "Yiddish Songs from Warsaw", author: "Jane Peppler", publisher_id: 1})
Book.create({title: "The Secret History", author: "Donna Tart", publisher_id: 1})
Book.create({title: "The Lion, The Witch and the Wardrobe", author: "C.S. Lewis", publisher_id: 4})
Book.create({title: "The Old Man and the Sea", author: "Ernest Hemingway", publisher_id: 5})

100.times do
  Book.create(
    title: Faker::Book.unique.title,
    author: Faker::Book.unique.author,
    publisher_id: rand(1..5)
  )
end

#finally, some copies in stock data:
Copy.create({book_id: 1, shop_id: 1, copies_in_stock: 123, copies_sold: 77})
Copy.create({book_id: 2, shop_id: 1, copies_in_stock: 66, copies_sold: 304})
Copy.create({book_id: 3, shop_id: 1, copies_in_stock: 931, copies_sold: 49})

Copy.create({book_id: 3, shop_id: 5, copies_in_stock: 6, copies_sold: 83})
Copy.create({book_id: 4, shop_id: 5, copies_in_stock: 0, copies_sold: 200})
Copy.create({book_id: 5, shop_id: 5, copies_in_stock: 600, copies_sold: 0})

200.times do
  Copy.create(
    book_id: rand(1..104),
    shop_id: rand(1..5),
    copies_in_stock: rand(0..500),
    copies_sold: rand(1..500)
  )
end

#updating total books_sold_count attribute to each shop
(1..5).step() do |n|
  shop = Shop.find(n)
  shop.update(
    books_sold_count: shop.copies.map{|e| e.copies_sold}.reduce(:+)
  )
  shop.save
end

#note: there may be multiple copies of the same book_id at the same shop, but this happens in real life, ex: same book, different cover.
