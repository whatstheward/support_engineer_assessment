class Country < ApplicationRecord
  include HTTParty

  has_many :engineers

  def self.fetch_all
    countries = HTTParty.get("https://restcountries.eu/rest/v2/all")
  end
end
