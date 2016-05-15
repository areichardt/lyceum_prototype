class DiscussionCommentsController < ApplicationController
  
  def create
    if params[:body]
      x = DiscussionComment.create(user_id: params[:user_id], comment_id: params[:comment_id], body: params[:body])
      redirect_to '/comments/#{x.comment_id}'
    end
  end

end
