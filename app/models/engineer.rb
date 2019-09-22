class Engineer < ApplicationRecord
  belongs_to :country
  belongs_to :team

  has_many :bookshelves
  has_many :books, through: :bookshelves
  has_many :engineer_programming_languages
  has_many :programming_languages, through: :engineer_programming_languages

  def self.oldest_functional_programming
    cache = []
    Engineer.all.map{|engineer| engineer.checkLanguages(cache)}
    final = cache.sort{|a,b| b.age <=> a.age}
    if final[0].age === final[1].age
      final[0].getRepoCount > final[1].getRepoCount ? final[0] : final[1]
    else
      return final[0]
    end
  end

  def checkLanguages(cache)
    if self.programming_languages.any?{|lang| lang.category==="Functional"}
      self.checkAge(cache)
    else
      return nil
    end
  end

  def checkAge(cache)
    if cache.length === 0
      cache << self
    elsif cache.last.age < self.age 
      cache << self
    end
  end

  def getRepoCount
    self.engineer_programming_languages.select{|lang| lang.programming_language.category == "Functional"}.max_by{|a| a.repositories}.repositories
  end

  def self.get_engineers_by_language(term)
    Engineer.all.select{|engineer| engineer.programming_languages.find{|lang| lang.name === term}}
  end

  def self.book_least_read(engineers)
    cache = {}
    engineers.each do |engineer|
      engineer.books.each do |book|
        if cache[book.id]
          cache[book.id] += 1
        else
          cache[book.id] = 1
        end
      end
    end
    Book.find(cache.key(cache.values.min))
  end

end
