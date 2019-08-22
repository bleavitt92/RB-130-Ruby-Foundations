items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
gather(items) do |*crops1, crops2|
  puts crops1.join(', ')
  puts crops2
end

  # Let's start gathering food.
  # apples, corn, cabbage
  # wheat
  # We've finished gathering!

puts ''
# 2
gather(items) do |crop1, *crop2, crop3 |
  puts crop1
  puts crop2.join(', ')
  puts crop3
end

  # Let's start gathering food.
  # apples
  # corn, cabbage
  # wheat
  # We've finished gathering!

puts ''
# 3
gather(items) do |crop1, *crop2|
  puts crop1
  puts crop2.join(', ')
end
  # Let's start gathering food.
  # apples
  # corn, cabbage, wheat
  # We've finished gathering!

puts ''
# 4
gather(items) do |crop1, crop2, crop3, crop4|
  puts "#{crop1}, #{crop2}, #{crop3}, and #{crop4}"
end
  # Let's start gathering food.
  # apples, corn, cabbage, and wheat
  # We've finished gathering!