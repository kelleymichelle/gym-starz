class GymnastSkill < ActiveRecord::Base
  belongs_to :gymnast
  belongs_to :skill
end
