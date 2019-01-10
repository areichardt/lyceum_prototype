class Circle < ActiveRecord::Base
  has_many :user_circles
  has_many :users, through: :user_circles
  has_many :comments
  has_many :question_answers
  has_many :lesson_plans
end
