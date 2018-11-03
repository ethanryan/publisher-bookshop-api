class Publisher < ApplicationRecord
    has_many :books
    has_many :books_in_stocks, through: :books
    has_many :shops, through: :books_in_stocks
end
