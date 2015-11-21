class WalkersController < ApplicationController

  def index
    @walkers = Walker.all
    render :index
  end

  def show
    @walker = Walker.find(params[:id])
  end

end
