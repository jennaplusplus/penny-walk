#this logic takes the L/R, # of blocks, and sequence data from the turns model and outputs a html canvas document.

# data here is the left_right, blocks, & sequence in arrays of those data
def generate_cartesian(left_right, blocks, sequence)
  x_array = []
  y_array = []
  sequence.each do
    if sequence == 0
      y = blocks[sequence]
      x_array.push(0)
      y_array.push(y)
    elsif sequence == 1
      if left_right == "right"
        x += blocks[sequence]
      else
        x -= blocks[sequence]
      end
      x_array.push(x)
      y_array.push(y)
    elsif sequence % 2 == 0 #if sequence step is even
      if left_right == "left"
        if x_array[-1] > x_array[-2]
          y -= blocks[sequence]
        else
          y += blocks[sequence]
      else #if left_right is "right"
        if x_array[-1] > x_array[-2]
          y += blocks[sequence]
        else
          y -= blocks[sequence]
      end
      x_array.push(x)
      y_array.push(y)
    else #if sequence step is odd
      if left_right == "left"
        if y_array[-1] > y_array[-2]
          x -= blocks[sequence]
        else
          x += blocks[sequence]
      else #if left_right is "right"
        if y_array[-1] > y_array[-2]
          x += blocks[sequence]
        else
          x -= blocks[sequence]
      end
      x_array.push(x)
      y_array.push(y)
    end
  end
end
