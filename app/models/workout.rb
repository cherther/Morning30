class Workout < ActiveRecord::Base
  belongs_to :user_profile
  belongs_to :workout_type
  validates_numericality_of :user_profile_id
  validates_presence_of :workout_date
  validates_numericality_of :workout_length
  
  def workout_date_display
    workout_date.strftime("%A, %B %d, %Y")
  end
end
