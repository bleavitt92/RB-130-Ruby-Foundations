def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute(4) { |num| num+ 5 + 3 }
p compute('c') { |char|'a' + 'b' + char }
p compute(2) == 'Does not compute.'