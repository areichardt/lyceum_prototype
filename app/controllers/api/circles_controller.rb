class Api::CirclesController < ApplicationController
  
  def index
    @circle = Circle.all
    render json: @circle
  end 
end
