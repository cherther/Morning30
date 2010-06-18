class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table :workouts do |t|
      t.integer :user_profile_id
      t.date :workout_date
      t.integer :workout_type_id
      t.integer :workout_length

      t.timestamps
    end
  end

  def self.down
    drop_table :workouts
  end
end
