# less than 10 digits--bad
# is 10 digits -- good
# is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
# 11 digits and the first number is not 1, then -- bad number
# is more than 11 digits -- bad number

# instance method number cleans up the string on numbers to be only numbers
# => use reg ex? /^\W?\d{3}\W?\W?\d{3}\W?\d{4}$/

class PhoneNumber
  INVALID = '0000000000'
  attr_accessor :phonenumber

  def initialize(phonenumber)
    @phonenumber = phonenumber
  end

  def number
    loop do 
      if valid?
        return phonenumber.gsub(/\D/, '')
      elsif phonenumber.match(/^1\s?\W?\d{3}\W?\W?\d{3}\W?\d{4}$/)
        phonenumber.gsub!(/^1/, '')
      elsif !valid?
        return INVALID
      end
    end
  end

  def valid?
    phonenumber.match(/^\W?\d{3}\W?\W?\d{3}\W?\d{4}$/)
  end

  def area_code
    phonenumber[0..2] if valid?
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end
