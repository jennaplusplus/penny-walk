class TurnsController < ApplicationController
  def show
    @turn = Turn.find(params[:id])
    if @turn.left_right == true
      @direction = "right"
      @heads_or_tails = "HEADS"
    elsif @turn.left_right == false
      @direction = "left"
      @heads_or_tails = "TAILS"
    else
      @direction = "straight"
    end

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
    prev_seq = Turn.last.sequence
    turn = Turn.create(left_right: generate_left_right, blocks: generate_blocks, trip_id: params[:trip_id], sequence: prev_seq + 1)
    redirect_to walker_trip_turn_path(id: turn.id, trip_id: turn.trip_id)
  end
end
