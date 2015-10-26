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
  	comp_play = computer_play
  	(play == :rock && comp_play == :scissors) || 
  	(play == :paper && comp_play == :rock) || 
  	(play == :scissors && comp_play == :paper)
  end

  def tied?
  	comp_play = computer_play
  	play == comp_play
  end

  def lost?
  	comp_play = computer_play
  	(play == :rock && comp_play == :paper) || 
  	(play == :paper && comp_play == :scissors) || 
  	(play == :scissors && comp_play == :rock)
  end

end
