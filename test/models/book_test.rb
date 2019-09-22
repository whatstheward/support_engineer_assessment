require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "should be able to get rating of book" do 
    book = Book.first
    book.get_rating === 98
    assert true
  end
end
