class QuestionAnswer < ActiveRecord::Base
  belongs_to :user 
  belongs_to :circle
  has_many :answers
end
