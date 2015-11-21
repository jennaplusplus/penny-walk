class TripsController < ApplicationController
  def create
    walker_id = params[:walker_id]
    start_latitude = "37.4275124"
    start_longitude = "-122.1818026"
    Trip.create(walker_id: walker_id, start_latitude: start_latitude, start_longitude: start_longitude)
    redirect_to walker_trip_path(walker_id: 1, id: 1)
    # render :index
  end

  def show

  end
end
