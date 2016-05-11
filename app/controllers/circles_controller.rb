class CirclesController < ApplicationController

  def show 
   @circle = Circle.find(params[:id])
  end
  
  def new 
  end 

  def create
    if params[:body]
      Comment.create(body: params[:body], user_id: params[:user_id], circle_id: params[:circle_id])
      redirect_to '/circles/#{params[:circle_id]}/discussion'
    else 
      nil
    end
    
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
   
  def update
    if params[:id]
      join_table = UserCircle.find_by(circle_id: params[:id], user_id: current_user.id)
      if join_table.destroy
        flash[:success] = "You Left A Circle"
      redirect_to '/'
      end
    end
  end 
  

  def search_for_circle
    @circles = Circle.where("name LIKE ?", "%" + params[:name] + "%")
  end 
  
  def discussion 
    if params[:body]
      Comment.create(body: params[:body], user_id: params[:user_id], circle_id: params[:circle_id])
    end
    @circle = Circle.find(params[:id])
  end



end