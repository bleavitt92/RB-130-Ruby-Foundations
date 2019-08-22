# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

# input: integer
# output: array of integers
# find all divisors of the input
# from 1.upto the input, include the number in the output array if the input % number == 0

def divisors(num) # optimized more than divisors_2
  output = []
  1.upto(Integer.sqrt(num)) do |n|
    if num % n == 0
      output << [n, num/n]
    end
  end
  output.flatten.uniq.sort!
end

def divisors_2(num)
  (1..Integer.sqrt(num)).select { |n| num % n == 0 }
end


p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
