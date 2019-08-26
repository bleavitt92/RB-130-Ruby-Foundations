# use #Integer.to_s(2) to convert to binary

# rules: 
    # 1 = wink
    # 10 = double blink
    # 100 = close your eyes
    # 1000 = jump
    # 10000 = Reverse the order of the operations in the secret handshake.

# test cases: 
    # handshake = SecretHandshake.new 9 (1001)
    # handshake.commands # => ["wink","jump"]
    
    # handshake = SecretHandshake.new "11001"
    # handshake.commands # => ["jump","wink"]

# 1 -->1 -->  wink
# 2 --> 10 --> double blink
# 3 --> 11 -- > wink, double blink
# 4 --> 100 --> close your eyes
# 5 --> 101 --> wink, close your eyes

# 19 --> 10011 --> double blink, wink
# ?? --> 11001 --> jump, wink b/c 11001 - 10000 = 1001 which is wink, jump but 10000 reverses it

# first convert input number to binary using .to_s(2)
# initialize local variable reverse == true
# second if > 10000, subtract 10,000 and set reverse == false
# iterate through the hash, if num > key, subtract the key from the number and add the value to the array

class SecretHandshake
  CODE = {
    1000 => 'jump',
    100 => 'close your eyes',
    10 => 'double blink',
    1 => 'wink',
  }
  attr_reader :number

  def initialize(base_ten_number)
    @number = base_ten_number
  end

  def commands
    number.class == Integer ? binary = number.to_s(2).to_i : binary = number.to_i

    reverse_the_array = true
    secret_string = []

    if binary >= 10000
      reverse_the_array= false 
      binary -= 10000
    end
    
    CODE.each do |key, string|
      if binary >= key
        binary -= key
        secret_string << string
      end
    end
    reverse_the_array ? secret_string.reverse : secret_string
  end
end

handshake = SecretHandshake.new(10)
p handshake.commands
