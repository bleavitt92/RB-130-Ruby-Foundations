# how to determine if n is prime?
# iterate from 2.upto(n-1), if n % num == 0, not prime

# to find the nth prime: 
# => set number = 2
# => loop checking if each number is prime
# => if so, add to prime array
# => add 1 to number and continue
# => break when prime array.size == n

class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    primes = []
    number = 2
    loop do 
      primes << number if prime?(number) 
      number += 1
      break if primes.size == n
    end
    primes[-1]
  end

  def self.prime?(num)
    2.upto(num-1) {|d| return false if num % d == 0 }
    true
  end
end

