class ProgrammingLanguage < ApplicationRecord
  has_many :engineer_programming_languages
  has_many :engineers, through: :engineer_programming_languages
end
