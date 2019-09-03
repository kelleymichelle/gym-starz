class Gym < ActiveRecord::Base
  has_secure_password
  has_many :gymnasts

  validates :name, presence: true
  validates :name, presence: true, uniqueness: true
  
end
