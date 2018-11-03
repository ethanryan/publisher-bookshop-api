class Shop < ApplicationRecord
  has_many :books_in_stocks
  has_many :books, through: :books_in_stocks
  has_many :publishers, through: :books
end
