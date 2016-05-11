class PagesController < ApplicationController

  def home 
    if current_user == nil
      redirect_to '/users/sign_in'
    else 
      @user = current_user
    end
  end

  def user_page
  end 


end
