require 'spec_helper'

describe Workout do
  before(:each) do
    @valid_attributes = {
      :user_profile_id => 1,
      :workout_date => Date.today,
      :workout_type_id => 1,
      :workout_length => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Workout.create!(@valid_attributes)
  end
end
