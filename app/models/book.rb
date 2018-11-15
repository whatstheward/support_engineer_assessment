class Book < ApplicationRecord
  has_many :bookshelves
  has_many :engineers, through: :bookshelves
end
