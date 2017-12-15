grid = []

100.times.each do |i|
  grid[i] = Array.new(100, 0)
end

x = 50
y = 50
direction = "right"
is_turning = false
path_length = 1
steps_taken = 0
times = 0

grid[x][y] = 1

100.times.each do |i|
  grid[x][y] = grid[x + 1][y] +
               grid[x - 1][y] +
               grid[x][y + 1] +
               grid[x][y - 1] +
               grid[x + 1][y + 1] +
               grid[x - 1][y + 1] +
               grid[x + 1][y - 1] +
               grid[x - 1][y - 1] +
               grid[x][y]
  break if grid[x][y] > 312051
  if is_turning
    case direction
    when "right"
      direction = "up"
    when "up"
      direction = "left"
    when "left"
      direction = "down"
    when "down"
      direction = "right"
    end
    is_turning = false
  end

  case direction
  when "right"
    x = x + 1
  when "up"
    y = y + 1
  when "left"
    x = x - 1
  when "down"
    y = y - 1
  end

  
  steps_taken = steps_taken + 1
  if steps_taken == path_length
    steps_taken = 0
    is_turning = true
    times = times + 1
    if times == 2
      times = 0
      path_length = path_length + 1
    end
  end
end

grid.each do |row|
  row.each do |item|
    
  end
  puts ""
end
