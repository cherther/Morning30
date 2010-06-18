class WorkoutsController < ApplicationController

  before_filter :login_required, :except => [:all, :top]
  # All Workouts
  # => /workouts
  # /workouts/all
  # /workouts.xml
  def all
    if params[:id] != nil
      id = params[:id]
      @workout = Workout.find_by_id(id)
    end
    
    totals = Workout.find(:first, :select => 'sum(workout_length) as total_mins, count(*) as total_count')
    @total_mins = totals.total_mins
    @total_count = totals.total_count
    @workouts = Workout.find(:all, :limit => 50, :order => 'workout_date desc, created_at desc')
    
  end
  
  # My Workouts
  # => /myworkouts
  # /workouts/my/(5)
  def my
    if self.current_user == nil
      redirect_to "/account/login"
    end
    condition = ['user_profile_id = :user_profile_id', { :user_profile_id => self.current_user.id }]
    id = params[:id] != nil ? params[:id] : Workout.find(:first, :select => 'max(id) as last_id', :conditions => condition).last_id
    @workout = Workout.find_by_id(id, condition)

    totals = Workout.find(:first, :select => 'sum(workout_length) as total_mins, count(*) as total_count', :conditions => condition)
    @total_mins = totals.total_mins
    @total_count = totals.total_count

    @workouts = Workout.find(:all, :conditions => condition, :limit => 50, :order => 'workout_date desc, created_at desc')    
  end
  
  # Show users with most minutes / workouts
  # => /leaderboard
  # /workouts/top
  def top
    totals = Workout.find(:first, :select => 'sum(workout_length) as total_mins, count(*) as total_count')
    @total_mins = totals.total_mins
    @total_count = totals.total_count
    @users = Workout.find(:all, 
      :select => 'user_profile_id, SUM(workout_length) as workout_length, COUNT(*) as number_workouts', 
      :group => 'user_profile_id',
      :order => 'number_workouts desc, workout_length desc',
      :limit => 10)
  end
  
  # Show single workout
  # => /workout
  # /workouts/show/5
  def show
    @workout = Workout.find(params[:id])
  end
  
  # Checkin new workout
  # => /checkin
  # /workouts/checkin
  def checkin
    if self.current_user == nil
      redirect_to "/account/login"
    end
    @workout = Workout.new
    @workout.workout_date = Time.now.to_date #.strftime("%x")
  end
  
  #Save new workout
  # => /save
  # /workouts/save
  def save
    @workout = Workout.new(params[:workout])
    #@workout.user_profile_id = self.current_user.id
    if @workout.save
      redirect_to "/myworkouts/#{@workout.id}"
    else
      render :action => 'checkin' #{@workout.id}"
    end
  end
end
