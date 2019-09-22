require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  test "the truth" do
    country = Country.new
    assert_not country.save
  end

  test "a country has many engineers" do
    
  end
end
