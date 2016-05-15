class AddedFriendRequestToUserCircles < ActiveRecord::Migration
  def change
    add_column :user_circles, :accepted, :boolean 
  end
end
