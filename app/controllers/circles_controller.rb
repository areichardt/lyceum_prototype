class CirclesController < ApplicationController

 
  def show 
   @circle = Circle.find(params[:id])
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
      flash[:success] = "You have requested to become #{User.find_by(id: UserCircle.find_by(circle_id: params[:circle_id], teacher: true).user_id).email}'s pupil in \"#{Circle.find_by(id: params[:circle_id]).name}\"" 
      redirect_to '/'
    end
  end
   
  def edit
    @circle = Circle.find_by(id: params[:id])
    render 'edit_lesson_plan.html.erb'
  end


  def update
    @circle = Circle.find_by(id: params[:id])
    @circle.update(lesson_plan: params[:lesson_plan], name: params[:name]).save
    flash[:success] = "Updated Lesson Plan For #{@circle.name}"
    redirect_to '/'
  end
  

   def search_for_circle
    if params[:name] == ("all" || "All")
      @circles = Circle.all
    else
      @circles = Circle.where("name LIKE ?", "%" + params[:name] + "%")
    end
  end 
  
 
end