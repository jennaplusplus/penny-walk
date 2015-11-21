class WalkersController < ApplicationController

  def index
    @walkers = Walker.all
    render :index
  end

  def show
    @walker = Walker.find(params[:id])
  end

  def new
    @walker = Walker.new
  end

  def create
    Walker.create(walker_params[:walker])
    redirect_to action: :index
  end

  private

  def walker_params
    params.permit(walker:[:name])
  end

end
