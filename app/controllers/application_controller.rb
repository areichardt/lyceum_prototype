class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout
  before_filter :get_comment  #:new_book
  before_filter :get_question
  
  private

  def layout
    # only turn it off for login pages:
    is_a?(Devise::SessionsController) ? false : "application"
    # or turn layout off for every devise controller:
    !devise_controller? && "application"
  end

  private

  def get_comment
    @comment = Comment.new
  end
  
  def get_question
    @question = QuestionAnswer.new
  end
 

  # def new_book
  #   @book = Book.new
  # end


end
