class CreateWorkoutTypes < ActiveRecord::Migration
  def self.up
    create_table :workout_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :workout_types
  end
end
