class QuestionAnswersController < ApplicationController
  
  def create 
    @question = QuestionAnswer.create(body: params[:body], user_id: params[:user_id], circle_id: params[:circle_id], teacher: params[:teacher])
    redirect_to "/private_discussion/#{@question.id}"
    
  end

  def private_discussion
    @question = QuestionAnswer.find_by(id: params[:id])
  end 

end
