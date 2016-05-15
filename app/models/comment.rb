class Comment < ActiveRecord::Base
  validates :body, presence: true, uniqueness: true
  belongs_to :user
  belongs_to :circle
  has_many :discussion_comments
end
