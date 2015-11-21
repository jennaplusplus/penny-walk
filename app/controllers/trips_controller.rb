class TripsController < ApplicationController
  def index
    w = Walker.find(params[:walker_id])
  end

  def create
    walker_id = params[:walker_id]
    start_latitude = "37.4275124"
    start_longitude = "-122.1818026"
    trip = Trip.create(walker_id: walker_id, start_latitude: start_latitude, start_longitude: start_longitude)
    redirect_to walker_trip_path(walker_id: walker_id, id: trip.id)
  end

  def show

  end

  def test_location
    @trip = Trip.find(params[:id])
    @start_latitude, @start_longitude = @trip.get_current_location
  end

  def update
    @trip = Trip.find(params[:id])
    end_latitude, end_longitude = @trip.get_current_location
    @trip.update(end_latitude: end_latitude, end_longitude: end_longitude)
    redirect_to test_location_path(walker_id: @trip.walker_id, id: params[:id])
  end

end
