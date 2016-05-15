class Api::CirclesController < ApplicationController
  
  def index
    if current_user 
      @circles = Circle.all
      render 'index.json.jbuilder'
end
  end 
  
  def show 
    @circle = Circle.find(params[:id])
    render 'show.json.jbuilder'
  end 


  def create 
    comment = Comment.new(body: params[:body], user_id: params[:user_id], circle_id: params[:circle_id])
      if comment.save 
        @circle = Circle.find_by(id: params[:circle_id])
        redirect_to 'show.json.jbuilder'
      end
  end
end
