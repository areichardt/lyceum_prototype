class CreateDiscussionComments < ActiveRecord::Migration
  def change
    create_table :discussion_comments do |t|
      t.integer :comment_id
      t.integer :user_id
      t.text :body

      t.timestamps null: false
    end
  end
end
