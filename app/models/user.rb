class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_books 
  has_many :books, through: :user_books
  has_many :user_circles
  has_many :circles, through: :user_circles
  has_many :comments
  has_many :user_images
  has_many :images, through: :user_images
  has_many :discussion_comments
  has_many :question_answers
  has_many :answers


# def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password #:image) }
  #   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me #:image) }
  #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :full_name, :description, :password, :current_password, :password_confirmation #:image) }
  # end




end
