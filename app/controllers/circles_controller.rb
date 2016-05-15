class CirclesController < ApplicationController

  def show 
   @circle = Circle.find(params[:id])
   # render 'circle_info_and_discussion.html.erb'
  end
  
  def new 
  end 

  def create
    if params[:body]
      Comment.create(body: params[:body], user_id: params[:user_id], circle_id: params[:circle_id])
      redirect_to '/'
    else 
      nil
    end
    
    if params[:name]
     @circle = Circle.create(name: params[:name])
      UserCircle.create(circle_id: @circle.id, user_id: current_user.id, teacher: true, accepted: true) 
      flash[:success] = "You Started a New Circle Called #{params[:name]}!"
      redirect_to '/'
    end

    if params[:user_id]
      UserCircle.create(circle_id: params[:circle_id], user_id: params[:user_id], teacher: params[:teacher], accepted: params[:accepted])
      flash[:success] = "You have requested to join the circle -- \"#{Circle.find_by(id: params[:circle_id]).name}\" --and become #{User.find_by(id: UserCircle.find_by(circle_id: params[:circle_id], teacher: true).user_id).email}'s Pupil."
      redirect_to '/'
    end
  end
   
  def update
    if UserCircle.find_by(id: params[:id])
      a = UserCircle.find_by(id: params[:id])
      a.update(accepted: true) 
      flash[:success] = "You accepted a new member to your circle: #{Circle.find_by(id: UserCircle.find_by(id: params[:id]).circle_id).name} "
    
    else 
     params[:id]
      join_table = UserCircle.find_by(circle_id: params[:id], user_id: current_user.id)
      join_table.destroy
      flash[:success] = "You Left A Circle"

    end
      redirect_to '/'
  end
  
  def search_for_circle
    @circles = Circle.where("name LIKE ?", "%" + params[:name] + "%")
  end 
  
  def discussion 
    if params[:body]
      Comment.create(body: params[:body], user_id: params[:user_id], circle_id: params[:circle_id])
    end
    @circle = Circle.find(params[:id])
    # render "angular_discussion.html.erb"
  end

end