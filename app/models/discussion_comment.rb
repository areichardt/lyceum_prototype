class DiscussionComment < ActiveRecord::Base
  validates :body, presence: true, uniqueness: true
  belongs_to :comment  
  belongs_to :user
end
