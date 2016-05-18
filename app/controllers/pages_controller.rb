class PagesController < ApplicationController

  def home 
    if current_user == nil
      redirect_to '/users/sign_in'
    else 
      @user = current_user
    end
  end

  def new_pic
    if params[:id] == current_user.id
      @image = Image.create(src: params[:src])
      UserImage.create(image_id: @image.id, user_id: current_user.id)
      if @image.save 
        flash[:success] = "You added a new image!"
      else 
        flash[:warning] = "Error: Picture did not save"
      end
    end
   redirect_to '/'
  end

  def user_resources
    @user = User.find_by(id: params[:id])
  end


end
