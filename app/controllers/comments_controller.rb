class CommentsController < ApplicationController
  
  def show 
    @comment = Comment.find(params[:id])
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

end

