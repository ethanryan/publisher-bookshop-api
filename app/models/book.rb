class Book < ApplicationRecord
  belongs_to :publisher
  has_many :copies
end
