class AddedBooleantoUserCircles < ActiveRecord::Migration
  def change
    add_column :user_circles, :teacher, :boolean
  end
end
