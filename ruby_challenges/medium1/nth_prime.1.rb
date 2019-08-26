class Prime
  def self.is_prime?(num)
    (2..num-1).select { |n| num % n == 0 }.empty?
  end
  
  def self.nth(n)
    raise ArgumentError if n<1
    count = 0
    number = 2
    loop do
      count += 1 if is_prime?(number)
      return number if count == n
      number += 1
    end
  end
end

p Prime.nth(1000)
