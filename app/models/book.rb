class Book < ActiveRecord::Base
  has_attached_file :epub 
  validates_attachment_content_type :epub, content_type: "application/epub+zip", :path => ":rails_root/public/system/:attachment/:id" 

  has_many :user_books 
  has_many :users, through: :user_books
end
