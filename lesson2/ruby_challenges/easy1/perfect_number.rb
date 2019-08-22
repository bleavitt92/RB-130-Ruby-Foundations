# input: number
# output: 'perfect', 'deficient', 'abundant'
#plan: need all factors of the number
  # 1.upto(n) if n % num == 0, include in factor array

# add up all elements in the factors array, if == number: perfect, etc. 

class PerfectNumber
  def self.classify(n)
    raise RuntimeError if n<0

    sum = (1..n-1).to_a.select { |divisor| n % divisor == 0 }.inject(:+)
    
    case
    when sum == n then 'perfect'
    when sum > n then 'abundant'
    when sum < n then 'deficient'
    end
  end
end

p PerfectNumber.classify(6)
p PerfectNumber.classify(10)
p PerfectNumber.classify(12)
