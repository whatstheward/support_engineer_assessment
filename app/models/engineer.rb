class Engineer < ApplicationRecord
  belongs_to :country
  belongs_to :team

  has_many :bookshelves
  has_many :engineer_programming_languages
  has_many :programming_languages, through: :engineer_programming_languages
  has_many :books, through: :bookshelves
end
