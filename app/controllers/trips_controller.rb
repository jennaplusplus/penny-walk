class TripsController < ApplicationController
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
    trip = Trip.find(params[:walker_id])
    @start_latitude, @start_longitude = trip.get_current_location
  end

end
