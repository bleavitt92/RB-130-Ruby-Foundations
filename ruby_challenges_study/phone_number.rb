class PhoneNumber
  def initialize(number)
    @number = number
    format_number
  end

  def number
    return '0000000000' if invalid?(@number)
    @number
  end

  def format_number
    @number = @number.gsub(/[-\.\(\) ]/, '')
    @number.gsub!(/\A1/, '') if @number.length == 11 && @number[0] == '1'
  end

  def area_code
    @number[0..2]
  end

  def invalid?(string)
    string.match(/[A-Za-z]/) ||
    string.length < 10 || 
    string.length == 11 && string[0] != '1' ||
    string.length > 11
  end

  def to_s
    "(#{@number[0, 3]}) #{@number[3, 3]}-#{@number[6, 4]}"
  end
end

