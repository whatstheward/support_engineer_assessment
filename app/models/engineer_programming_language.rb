class EngineerProgrammingLanguage < ApplicationRecord
  belongs_to :engineer
  belongs_to :programming_language

  validates_uniqueness_of :engineer_id, :scope => :programming_language_id
end
