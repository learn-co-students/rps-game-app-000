### THIS DOES NOT PASS THE SPEC, BUT I THINK IT IS BEST, EVEN THOUGH IT COULD, BECAUSE OF THE NOTES THAT FOLLOW:

class RPSGame

  attr_reader :type, :comp_type

  PlayTypeError = "Get outta town!"

  def initialize(type)
    case type
    when :paper, :rock, :scissors
      @type = type
      @comp_type = computer_play
    else
      raise PlayTypeError
    end
  end

  def computer_play
    [:rock, :paper, :scissors].sample.to_sym
  end

  def won?
    (@type == :rock && @comp_type == :scissors) || (@type == :scissors && @comp_type == :paper) || (@type == :paper && @comp_type == :rock) 
  end

  def tied?
    @type == @comp_type
  end

  def lost?
    !won? && !tied?
  end

  def self.valid_play?(type)
    type == :paper || type == :rock || type == :scissors
  end

end

=begin 
### AN RPS GAME THAT HAS SEPERATE WIN, LOSE, TIED METHODS, AND THAT ALSO MAKES SENSE HAS TO SET THE COMPUTER'S PLAY TO A VARIABLE OUTSIDE THE WIN LOSE TIED METHODS THEMSELVES, CANNOT PASS THE CURRENT SPEC, AND LOOKS SOMETHING LIKE THIS:

class RPSGame

  PlayTypeError = "Get outta town!"

  def initialize(type)
    case type
    when :paper, :rock, :scissors
      @type = type
      @comp_type = computer_play
    else
      raise PlayTypeError
    end
  end

  def computer_play
    [:rock, :paper, :scissors].sample.to_sym
  end

  def won?
    (@type == :rock && @comp_type == :scissors) || (@type == :scissors && @comp_type == :paper) || (@type == :paper && @comp_type == :rock) 
  end

  def tied?
    @type == @comp_type
  end

  def lost?
    !won? && !tied?
  end

  def self.valid_play?(type)
    type == :paper || type == :rock || type == :scissors
  end

end

### THE FOLLOWING MAKES NO SENSE FOR AN RPS GAME BECAUSE IT CHANGES THE COMPUTER'S PLAY DEPENDING ON THE METHOD YOU USE TO TEST (WON? LOST? TIED?), AND THE AMOUNT OF TIMES YOUT TEST, BUT IT PASSES THE SPEC EVERY TIME:

class RPSGame

  PlayTypeError = "Get outta town!"

  def initialize(type)
    case type
    when :paper, :rock, :scissors
      @type = type
    else
      raise PlayTypeError
    end
  end

  def computer_play
    [:rock, :paper, :scissors].sample.to_sym
  end

  def won?
    comp_type = computer_play
    (@type == :rock && comp_type == :scissors) || (@type == :scissors && comp_type == :paper) || (@type == :paper && comp_type == :rock) 
  end

  def tied?
    comp_type = computer_play
    @type == comp_type
  end

  def lost?
    comp_type = computer_play
    (@type == :scissors && comp_type == :rock) || (@type == :paper && comp_type == :scissors) || (@type == :rock && comp_type == :paper) 
  end

  def self.valid_play?(type)
    type == :paper || type == :rock || type == :scissors
  end

end

### THE FOLLOWING EASLIY MAKES THE LEAST SENSE OF ALL FOR OBVIOUS REASONS, HOWEVER ALSO PASSES THE SPEC EVERY TIME:

class RPSGame

  PlayTypeError = "Get outta town!"

  def initialize(type)
    case type
    when :paper, :rock, :scissors
      @type = type
    else
      raise PlayTypeError
    end
  end

  def computer_play
    [:rock, :paper, :scissors].sample.to_sym
  end

  def won?
    (@type == :rock && computer_play == :scissors) || (@type == :scissors && computer_play == :paper) || (@type == :paper && computer_play == :rock) 
  end

  def tied?
    @type == computer_play
  end

  def lost?
    (@type == :scissors && computer_play == :rock) || (@type == :paper && computer_play == :scissors) || (@type == :rock && computer_play == :paper) 
  end

  def self.valid_play?(type)
    type == :paper || type == :rock || type == :scissors
  end

end

=end