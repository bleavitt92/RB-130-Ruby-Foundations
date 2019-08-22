def step(start_val, end_val, step_val)
  current_val = start_val
  loop do 
    yield(current_val)
    current_val += step_val
    break if current_val > end_val
  end
end


step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10