class TurnsController < ApplicationController
  def show
    @turn = Turn.find(params[:id])
  end
end
