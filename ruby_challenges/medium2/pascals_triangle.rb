# n rows
# nth row has n elements
# always starts with 1 and ends with 1
# middle numbers are calculated based on the rows above
# ex: 2nd element in the 4th row is the 1st+2nd in the 3rd row
# ex: 3rd element in the 6th row is the 2nd and 3rd in the 5th row

# using combinations: 
# => row 0 is 0 combo 0
# 2nd row => row 1 is 1 combo 0,1 combo 1
# => row 2 is 2 combo 0, 2 combo 1, 2 combo 2
# 4th row => row 3 is 3 combo 0, 3 combo 1, 3 combo 2, 3 combo 3

# use nested array to arrange [[row1], [row2]]

class Triangle
  attr_reader :num_rows

  def initialize(num_rows)
    @num_rows = num_rows
  end

  def form_row(n)
    row = []
    0.upto(n-1) do |m|
      row << combination(n-1, m)
    end
    row
  end

  def rows
    triangle = []
    1.upto(num_rows) { |nth| triangle << form_row(nth) }
    triangle
  end

  def combination(n, m)
    return 1 if (n == 0 || m == 0)
    numerator = (1..n).to_a.reverse[0, m].inject(:*).to_i
    denominator = (1..m).to_a.inject(:*).to_i
    numerator/denominator
  end
end

