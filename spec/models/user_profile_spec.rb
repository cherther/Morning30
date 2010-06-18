require 'spec_helper'

describe UserProfile do
  before(:each) do
    @valid_attributes = {
      :identifier => "value for identifier",
      :user_name => "value for user_name",
      :email => "value for email",
      :first_name => "value for first_name",
      :last_name => "value for last_name"
    }
  end

  it "should create a new instance given valid attributes" do
    UserProfile.create!(@valid_attributes)
  end
end
