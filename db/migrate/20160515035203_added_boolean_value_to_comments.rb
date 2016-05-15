class AddedBooleanValueToComments < ActiveRecord::Migration
  def change
    add_column :comments, :discussion_question, :boolean
  end
end
