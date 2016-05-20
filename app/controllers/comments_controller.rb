class CommentsController < ApplicationController
  
  def show 
    @comment = Comment.find(params[:id])
    render 'show.html.erb'
  end 
  
  def create 
    @comment = Comment.create( 
      body: params[:body],
      user_id: params[:user_id],
      circle_id: params[:circle_id],
      discussion_question: params[:discussion_question]
      )
    redirect_to "/"
  end 
 
  def update 
    if Comment.find_by(id: params[:id])
      @comment = Comment.find_by(id: params[:id])
      @comment.update(body: params[:body], user_id: params[:user_id], circle_id: params[:circle_id], discussion_question: params[:discussion_question])
      redirect_to "/comments/#{@comment.id}", method: :get
    end 
  end 

 
 def destroy
  @comment = Comment.find_by(id: params[:id])
  @comment.destroy
  flash[:success] = "You ended a Discussion Circle"
  redirect_to '/'
 end


end

