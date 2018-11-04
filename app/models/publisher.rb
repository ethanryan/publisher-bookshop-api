class Publisher < ApplicationRecord
    has_many :books
    has_many :copies, through: :books
    has_many :shops, through: :copies
end
