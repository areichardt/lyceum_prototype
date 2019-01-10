class PagesController < ApplicationController
  
  before_filter :new_image
  
  def home 
    if current_user == nil
      redirect_to '/users/sign_in' 
    elsif current_user.admin == false
     @user = current_user
      render 'home.html.erb'
    else 
      @all_images = Image.all
      render 'admin_pics.html.erb'
    
    end 
  end
  
  def user_resources
    @user = User.find_by(id: params[:id])
  end
  
  private 

  def new_image
    @image = Image.new
  end
  
 
end
