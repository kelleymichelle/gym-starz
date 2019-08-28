class Gym < ActiveRecord::Base
  has_secure_password
  has_many :gymnasts
end
