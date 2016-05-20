class QuestionAnswersController < ApplicationController
  
  def create 
    if QuestionAnswer.find_by(user_id: params[:user_id], circle_id: params[:circle_id], teacher: false)
      current_question = QuestionAnswer.find_by(user_id: params[:user_id], circle_id: params[:circle_id], teacher: false)
      current_question.destroy
      @question = QuestionAnswer.create(body: params[:body], user_id: params[:user_id], circle_id: params[:circle_id], teacher: params[:teacher])
      redirect_to "/private_discussion/#{@question.id}"
    else 
      @question = QuestionAnswer.create(body: params[:body], user_id: params[:user_id], circle_id: params[:circle_id], teacher: params[:teacher])
      redirect_to "/private_discussion/#{@question.id}"
    end
  end

  def private_discussion
    @question = QuestionAnswer.find_by(id: params[:id])
  end 

  def destroy 
    if params[:id]
      question = QuestionAnswer.find_by(id: params[:id])
      question.destroy
      Answer.where(question_answer_id: question.id).each {|x| x.destroy}
      flash[:success] = "You deleted your previously active question."
      redirect_to '/'
    end
  end

end
