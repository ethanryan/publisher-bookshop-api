class Shop < ApplicationRecord
  has_many :copies
  has_many :books, through: :copies
  has_many :publishers, through: :books
end
