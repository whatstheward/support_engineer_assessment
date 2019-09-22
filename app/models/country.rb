class Country < ApplicationRecord
  include HTTParty

  has_many :engineers

  def self.fetch_all
    countries = HTTParty.get("https://restcountries.eu/rest/v2/all")
  end

  def self.get_country_with_most_engineers
    Country.all.max_by{|country| country.engineers.length}
  end
end
