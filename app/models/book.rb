class Book < ApplicationRecord
  has_many :bookshelves
  has_many :engineers, through: :bookshelves

  def self.highest_rated
    cache = {}
    Book.all.each do |book| 
      if book.bookshelves.length > 0
      cache[book.id] = book.get_rating
      end
    end
    return Book.find(cache.key(cache.values.max))
  end

  def get_rating
    ratings = self.bookshelves.map{|bookshelf| bookshelf.rating.to_i}
    avg = ratings.reduce(:+) / ratings.length
  end

end
