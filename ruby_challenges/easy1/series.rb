class Series
  def initialize(string)
    @string = string
  end

  def slices(n)
    raise ArgumentError, 'n is too large for the string' if n > @string.length
    i = 0
    slices = []
    while i <= @string.size - n
      slices << @string.slice(i, n).split('').map(&:to_i )
      i += 1
    end
    slices
  end
end

str = Series.new('1234')
p str.slices(3)
