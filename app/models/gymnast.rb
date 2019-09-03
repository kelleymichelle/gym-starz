class Gymnast < ActiveRecord::Base
  has_many :gymnast_skills
  has_many :skills, through: :gymnast_skills
  belongs_to :gym
end
