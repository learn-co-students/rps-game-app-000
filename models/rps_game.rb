class RPSGame
  class PlayTypeError < StandardError; end

  VALID_PLAYS = [:rock, :paper, :scissors]

  def self.valid_play?(play)
  	VALID_PLAYS.include?(play)
  end	

  attr_accessor :play, :computer_play

  def initialize(play)
  	raise PlayTypeError unless self.class.valid_play?(play)
  	@play = play
    @computer_play = VALID_PLAYS.sample
  end

  def won?
  	(play == :rock && computer_play == :scissors) || 
  	(play == :paper && computer_play == :rock) || 
  	(play == :scissors && computer_play == :paper)
  end

  def tied?
  	play == computer_play
  end

  def lost?
  	(play == :rock && computer_play == :paper) || 
  	(play == :paper && computer_play == :scissors) || 
  	(play == :scissors && computer_play == :rock)
  end

end
