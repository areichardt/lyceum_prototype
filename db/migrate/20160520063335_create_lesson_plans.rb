class CreateLessonPlans < ActiveRecord::Migration
  def change
    create_table :lesson_plans do |t|
      t.integer :user_id
      t.integer :circle_id
      t.text :body

      t.timestamps null: false
    end
  end
end
