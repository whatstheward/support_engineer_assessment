class Team < ApplicationRecord
  has_many :engineers


  def self.biggest_three_bugs
    Team.all.sort{|a,b| a.engineers.length<=>b.engineers.length}.take(3).sort{|a,b| b.current_bugs <=> a.current_bugs}
  end

  def self.second_least_represented_team_region
    cache = {}
    Team.all.map do |team| 
      team.engineers.map do |engineer| 
      cache[engineer.country.region] ? cache[engineer.country.region] += 1 : cache[engineer.country.region] = 1
      end
    end
    return cache.key(cache.values.sort[1]) 
  end

  def self.capital_for_oldest_person_prolific_team
    Team.all.max_by{|team| team.features_shipped}.engineers.max_by{|engineer| engineer.age}.country.capital
  end

  def self.inventor_third_most_popular_language_by_floor
      cache = {}
      floor = Team.most_populated_floor
      teams = Team.all.select{|team| team.floor === floor}
      teams.each do |team| 
      team.most_used_languages.each do |lang|
        if cache[lang.id]
          cache[lang.id] += 1
        else
          cache[lang.id] = 1
          end
        end
      end
      return ProgrammingLanguage.find(cache.sort_by{|k,v| -v}[2][0]).inventor
  end

  def self.most_populated_floor
    floors = {}
    Team.all.each do |team| 
      if floors[team.floor]
        floors[team.floor] += 1
      else
        floors[team.floor] = 1
      end
    end
    return floors.key(floors.values.max)
  end

  def most_used_languages
    cache = {}
    self.engineers.map do |engineer| 
      engineer.programming_languages.map do |lang|
        if cache[lang.id]
          cache[lang.id] += 1
        else
          cache[lang.id] = 1
        end
      end
    end
    return cache.sort_by{|k,v| -v}.take(3).map{|k,v| ProgrammingLanguage.find(k)}
  end

end
