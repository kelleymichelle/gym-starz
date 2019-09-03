class Skill < ActiveRecord::Base
  has_many :gymnast_skills
  belongs_to :level
  has_many :gymnasts, through: :gymnasts_skills
end
