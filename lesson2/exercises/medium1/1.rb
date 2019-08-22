class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  # alternate listen method
  # def listen(&whats_said)
  #   record(whats_said) if block_given?
  # end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
listener.listen { "What a nice day!" }
listener.play