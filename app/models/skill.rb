class Skill < ActiveRecord::Base
  belongs_to :level
  has_many :gymnasts, through: :gymnasts_skills
end
