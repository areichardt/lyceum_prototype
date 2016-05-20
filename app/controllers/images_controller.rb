class ImagesController < ApplicationController
  
  def create 
    if @image == nil 
      flash[:warning] = "You did not select an image to add"
      redirect_to [:back]
    else 
    @image = Image.create(image_params)
    table = UserImage.create(image_id: @image.id, user_id: current_user.id)
    redirect_to '/'
    end
  end 

  private
  
  def image_params 
    params.require(:image).permit(:src)
  end 

end
