def my_method(array)
  yield(array)
end

p my_method([1, 2, 3, 4]) { |arr| arr[2..-1] }

birds = ['crow', 'finch', 'hawk', 'eagle']

my_method(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}"
end