class AddedBooleanToUserBooks < ActiveRecord::Migration
  def change
    add_column :user_books, :current_assignment, :boolean
  end
end
