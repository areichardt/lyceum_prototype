class UserCirclesController < ApplicationController

  def update
    if UserCircle.find_by(id: params[:id])
      a = UserCircle.find_by(id: params[:id])
      a.update(accepted: true) 
      flash[:success] = "You accepted a new member to your circle: #{Circle.find_by(id: UserCircle.find_by(id: params[:id]).circle_id).name} "
      redirect_to '/'
    end
   
  end 

  def destroy 
    if UserCircle.find_by(id: params[:id])
      join_table = UserCircle.find_by(circle_id: params[:id], user_id: current_user.id)
      join_table.destroy
      flash[:success] = "You Left A Circle"
      redirect_to '/'
    end
  end

end
