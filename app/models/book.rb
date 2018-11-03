class Book < ApplicationRecord
  belongs_to :publisher
  has_many :books_in_stocks
end
