class AddedDefaultToCircles < ActiveRecord::Migration
  def change
    change_column :circles, :lesson_plan, :text, default: " "
  end
end
