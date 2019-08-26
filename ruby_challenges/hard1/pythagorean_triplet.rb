class Triplet
  def initialize(a, b, c)
    @a = a
    @b = b  
    @c = c
  end

  def sum
    @a+@b+@c
  end

  def product
    @a*@b*@c
  end

  def pythagorean?
    @a**2 + @b**2 == @c**2
  end

  def self.where(sum: nil, min_factor:1, max_factor:)
    triplets = []
    min_factor.upto(max_factor) do |a|
      a.upto(max_factor) do |b|
        b.upto(max_factor) do |c|
          triplets << Triplet.new(a, b, c) if Triplet.new(a, b, c).pythagorean?
        end
      end
    end
    if sum
      triplets.select! { |triplet| triplet.sum == sum }
    else
      triplets
    end
  end
end
