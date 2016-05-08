class CirclesController < ApplicationController

  def show 
    @circle = Circle.find(params[:id])
  end 

  def new 
  end 

  def create
    if params[:name]
     @circle = Circle.create(name: params[:name])
      UserCircle.create(circle_id: @circle.id, user_id: current_user.id, teacher: true) 
      flash[:success] = "Successfully Created Club"
      redirect_to '/circles/#{@circle.id}'
    end

    if params[:user_id]
      UserCircle.create(circle_id: params[:circle_id], user_id: params[:user_id], teacher: params[:teacher])
      flash[:success] = "You've Joined A New Lit Circle"
      redirect_to '/'
    end
  end
   

  def search_for_circle
    @circles = Circle.where("name LIKE ?", "%" + params[:name] + "%")
  end 

end