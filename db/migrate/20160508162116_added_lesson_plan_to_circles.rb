class AddedLessonPlanToCircles < ActiveRecord::Migration
  def change
    add_column :circles, :lesson_plan, :text
  end
end
