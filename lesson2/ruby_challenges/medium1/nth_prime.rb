# => calcualte the nth prime number using the prime? method. Have a loop starting with a number at 2 and adding 1 each iteration. if the number is prime, add it to an array, if not, keep going. Once the array.size == n, return array[-1]

class Prime
  def self.is_prime?(num)
    (2..num-1).each { |n| return false if num % n == 0 }
  end
  
  def self.nth(n)
    raise ArgumentError if n<1
    primes = [2]
    test_number = 3
    while primes.size < n
      primes << test_number if is_prime?(test_number)
      test_number += 2
    end
    primes[-1]
  end
end
