require 'pry'
class Palindromes
  attr_accessor :min, :max, :factors, :value

  def initialize(max_factor:, min_factor: 1)
    @max = max_factor
    @min = min_factor
    @factors = find_factors(min, max)
  end

  def largest
    palindrome = Palindromes.new(max_factor: max, min_factor: min).generate
    Struct.new(:value , :factors).new(palindrome.keys.max, palindrome[palindrome.keys.max])
  end

  def smallest
    palindrome = Palindromes.new(max_factor: max, min_factor: min).generate
    Struct.new(:value , :factors).new(palindrome.keys.min, palindrome[palindrome.keys.min])
  end

  def find_factors(min, max)
    factor_hash = Hash.new
    min.upto(max) do |num1|
      min.upto(max) do |num2|
        product = num1*num2
        if factor_hash[product].nil?
          factor_hash[product] = [[num1, num2]].sort 
        else 
          factor_hash[product] << [num1, num2].sort
        end
      end
    end
    factor_hash.each do |k, v|
      v.uniq!
    end
    factor_hash
  end

  def generate
    @palindromes = factors.select { |k, v| k.to_s == k.to_s.reverse }
  end

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end
end
