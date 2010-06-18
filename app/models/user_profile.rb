class UserProfile < ActiveRecord::Base
  has_many :workouts
end
