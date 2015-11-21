class WalkersController < ApplicationController

  def start

  end

  def index

  end

  def show
    @walker = Walker.find(params[:id])
  end

end
