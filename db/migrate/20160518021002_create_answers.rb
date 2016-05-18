class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_answer_id
      t.text :body

      t.timestamps null: false
    end
  end
end
