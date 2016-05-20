class AnswersController < ApplicationController

  def create
    if params[:question_answer_id]
      answer = Answer.create(body: params[:body], user_id: params[:user_id], question_answer_id: params[:question_answer_id])
    end
    redirect_to "/private_discussion/#{answer.question_answer_id}"
  end


end
