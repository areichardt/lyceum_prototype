class CommentsController < ApplicationController
  

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

