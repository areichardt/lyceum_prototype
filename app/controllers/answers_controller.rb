class AnswersController < ApplicationController

  def create
    if params[:question_answer_id]
      Answer.create(user_id: params[:user_id], question_answer_id: params[:question_answer_id])
      redirect_to '/private_discussion/#{params[:question_answer_id]}'
    end
  end


end
