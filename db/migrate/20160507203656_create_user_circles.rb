class CreateUserCircles < ActiveRecord::Migration
  def change
    create_table :user_circles do |t|
      t.integer :circle_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
