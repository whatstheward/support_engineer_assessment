class Bookshelf < ApplicationRecord
  belongs_to :engineer
  belongs_to :book

  validates_uniqueness_of :engineer_id, :scope => :book_id
end
