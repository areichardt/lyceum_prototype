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

has_attached_file :image, :path => ":rails_root/public/system/images/:attachment/:id/:basename_:style.:extension", :url => "/system/:attachment/:id/:basename_:style.:extension",
 :styles => {
  :thumb    => ['100x100#',  :jpg, :quality => 70],
  :preview  => ['480x480#',  :jpg, :quality => 70],
  :large    => ['600>',      :jpg, :quality => 70],
  :retina   => ['1200>',     :jpg, :quality => 30]
},
:convert_options => {
  :thumb    => '-set colorspace sRGB -strip',
  :preview  => '-set colorspace sRGB -strip',
  :large    => '-set colorspace sRGB -strip',
  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
}

validates_attachment :image, size: { in: 0..10.megabytes },
                     content_type: { content_type: /^image\/(jpeg|png|gif|tiff)$/ }


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :image) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me, :image) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :full_name, :description, :password, :current_password, :password_confirmation, :image) }
  end




end
