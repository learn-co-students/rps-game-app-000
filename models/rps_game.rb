class PlayTypeError < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end
end

class RPSGame < PlayTypeError
  attr_accessor :play_type

  def self.valid_play?(play_type)
    play_types = [:rock, :paper, :scissors]
    return play_types.include?(play_type)
  end

  def initialize(play_type)
    if self.class.valid_play?(play_type)
      @play_type = play_type
    else
      raise PlayTypeError.new("Invalid Play Type Crazy Pants!!")
    end
  end

  def computer_play
    play_types = [:rock, :paper, :scissors]
    i = rand(0..2)
    return play_types[i]
  end

  def won?
    if @play_type == :scissors && computer_play == :paper
      return true
    elsif @play_type == :rock && computer_play == :scissors
      return true
    elsif @play_type == :paper && computer_play == :rock
      return true
    else
      return false
    end
  end

  def tied?
    if @play_type == computer_play
      return true
    elsif self.won? #== true
      return false
    else
      return false
    end
  end

  def lost?
    if self.won? == false
      if self.tied?
        return false
      end
    return true
    elsif self.won?
      return false
    else self.tied? #== true
      return false
    end
  end

end
