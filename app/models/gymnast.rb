class Gymnast < ActiveRecord::Base
  has_many :skills, through: :gymnast_skills
end
