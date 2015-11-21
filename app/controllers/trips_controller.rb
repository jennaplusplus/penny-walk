class TripsController < ApplicationController
  def index
    w = Walker.find(params[:walker_id])
    @trips = w.trips
  end

  def generate_left_right
    direction = rand(2)
    case direction
    when 0
      return false
    when 1
      return true
    end
  end

  def generate_blocks
    blocks = rand(1..3)
    return blocks
  end

  def create
    walker_id = params[:walker_id]
    start_latitude, start_longitude = Trip.get_current_location
    trip = Trip.create(walker_id: walker_id, start_latitude: start_latitude, start_longitude: start_longitude)
    first_turn_of_trip = Turn.create(blocks: generate_blocks, trip_id: trip.id, sequence: 0) # create the first turn
    redirect_to walker_trip_turn_path(walker_id: walker_id, trip_id: trip.id, id: first_turn_of_trip.id)
  end

  def show

  end

  def update
    @trip = Trip.find(params[:id])
    end_latitude, end_longitude = Trip.get_current_location
    @trip.update(end_latitude: end_latitude, end_longitude: end_longitude)
    redirect_to action: :end_trip
  end

  def end_trip
    @trip = Trip.find(params[:id])
    @walker = @trip.walker
    @start_latitude = @trip.start_latitude
    @start_longitude = @trip.start_longitude
    @end_latitude, @end_longitude = Trip.get_current_location
    blocks_traveled = 0
    @trip.turns.each do |turn|
      blocks_traveled += turn.blocks
    end
    @blocks_traveled = blocks_traveled
    render :endtrip
  end

end
