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

    t = @trip.turns
    left_right_array = []
    blocks_array = []
    sequence_array = []
    t.each do |turn|
      left_right_array.push(turn.left_right)
    end
    t.each do |turn|
      blocks_array.push(turn.blocks)
    end
    t.each do |turn|
      sequence_array.push(turn.sequence)
    end

    x_array, y_array = generate_cartesian(left_right_array, blocks_array, sequence_array)
    convert_ratio = image_convert_params(x_array, y_array)
    image_to_canvas_points(convert_ratio, x_array, y_array)

    @x_coordinates = x_array
    @y_coordinates = y_array
    @turns = @trip.turns.count + 2
    render :endtrip
  end

  private

  def generate_cartesian(left_right, blocks, sequence)
    x = 0
    y = 0
    x_array = []
    y_array = []
    sequence.each do |seq|
      if seq == 0
        y = blocks[seq]
        x_array.push(0)
        y_array.push(y)
      elsif seq == 1
        if left_right[seq] == true
          x += blocks[seq]
        else
          x -= blocks[seq]
        end
        x_array.push(x)
        y_array.push(y)
      elsif seq % 2 == 0 #if seq step is even
        if left_right[seq] == true
          if x_array[-1] > x_array[-2]
            y -= blocks[seq]
          else
            y += blocks[seq]
          end
        else #if left_right is "right"
          if x_array[-1] > x_array[-2]
            y += blocks[seq]
          else
            y -= blocks[seq]
          end
        end
        x_array.push(x)
        y_array.push(y)
      else #if seq step is odd
        if left_right[seq] == false
          if y_array[-1] > y_array[-2]
            x -= blocks[seq]
          else
            x += blocks[seq]
          end
        else #if left_right is "right"
          if y_array[-1] > y_array[-2]
            x += blocks[seq]
          else
            x -= blocks[seq]
          end
        end
        x_array.push(x)
        y_array.push(y)
      end
    end
    return x_array, y_array
  end

  def image_convert_params(x_array, y_array)
    img_width = x_array.max - x_array.min
    img_height = y_array.max - y_array.min
    if 450/img_width < 450/img_height
      convert_ratio = 450/img_width
    else
      convert_ratio = 450/img_height
    end
    return convert_ratio
  end

  def image_to_canvas_points(convert_ratio, x_array, y_array)
    # shift x-axis image points
    x_shift = x_array.min
    x_array.map! do |x|
      x + x_shift.abs
    end

    #shift y-axis image points
    y_shift = y_array.max
    y_array.map! do |y|
      y - y_shift.abs
      y = y * -1
    end

    # resize image points to canvas size
    x_array.map! do |x|
      x * convert_ratio
    end
    y_array.map! do |y|
      y * convert_ratio
    end
    return x_array, y_array
  end

end
