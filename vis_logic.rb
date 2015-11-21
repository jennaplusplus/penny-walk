#this logic takes the L/R, # of blocks, and sequence data from the turns model and outputs a html canvas document.
# 
# left_right = [nil, false, false, true, false, true, true]
# blocks = [3, 1, 3, 1, 2, 3, 1]
# sequence = [0, 1, 2, 3, 4, 5, 6]

# data here is the left_right, blocks, & sequence in arrays of those data
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

def image_wh(x_array, y_array)
  img_width = x_array.max - x_array.min
  img_height = y_array.max - y_array.min
  if 500/img_width < 500/img_height
    convert_ratio = 500/img_width
  else
    convert_ratio = 500/img_height
  end
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
end
