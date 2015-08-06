require "pry"

class RPSGame

  attr_accessor :object

  def initialize(object)
    if (object == :rock || object == :scissors || object == :paper)
      @object = object
    else 
    raise PlayTypeError
    end

  end

  def self.valid_play?(object2)
    if (object2 == :rock || object2 == :scissors || object2 == :paper)
      return true
    else
      return false
    end
  end

  def computer_play
    rand_number = Random.rand(1..3)
    if rand_number == 1
      return :scissors
    elsif rand_number == 2
      return :paper
    else
      return :rock
    end
  end

  def won?
    if @object == :rock && self.computer_play == :scissors
      return true
    elsif @object == :scissors && self.computer_play == :paper
    elsif @object == :paper && self.computer_play == :rock   
    else @object == self.computer_play
      return false
    end
  end

  def lost?
    if @object == :rock && self.computer_play == :paper
      return true
    elsif @object == :scissors && self.computer_play == :rock
    elsif @object == :paper && self.computer_play == :scissors   
    else @object == self.computer_play
      return false
    end
  end

  def tied?
    if    @object == self.computer_play
      return true
    else
      return false
    end
  end
        



end

class PlayTypeError < StandardError
  
  def initialize
     puts "You can't do that!"
  end

end
