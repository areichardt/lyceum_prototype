class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :user_id
      t.integer :circle_id
      t.boolean :teacher
      t.text :body

      t.timestamps null: false
    end
  end
end
