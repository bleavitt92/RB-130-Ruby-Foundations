require 'pry'
class ValueError < StandardError; end

class Board
  def self.transform(input)
    raise ValueError unless validate(input)

    input.each_with_index do |line, m| # iterate through each row
      n = 0
      line.each_char do |char| # iterate through each character 
        if char == ' '
          input[m][n] = count_surrounding_stars(input, m, n).to_s
        end
        n += 1
      end
    end
    p input
  end

  def self.validate(input)
    input.each_with_index do |line, index|
      return false if line.size != input[index-1].size ||
                      !line.match(/^[+|].+[|+]$/) ||
                      !line.match(/^[\+\*\s|-]+$/)
      end
    true
  end

  def self.count_surrounding_stars(array, m, n)
    count = 0
    count += 1 if star_at?(array[m][n-1])
    count += 1 if star_at?(array[m][n+1])
    count += 1 if star_at?(array[m-1][n-1])
    count += 1 if star_at?(array[m-1][n])
    count += 1 if star_at?(array[m-1][n+1])
    count += 1 if star_at?(array[m+1][n-1])
    count += 1 if star_at?(array[m+1][n])
    count += 1 if star_at?(array[m+1][n+1])
    count = ' ' if count == 0
    count
  end

  def self.star_at?(space)
    space == '*'
  end
end

