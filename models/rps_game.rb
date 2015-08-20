class RPSGame

	attr_reader :move, :comp

	def initialize(move)
		if move == :rock || move == :paper || move == :scissors
			@move = move
			@comp = computer_play
		else
			raise PlayTypeError
		end
	end

	def self.valid_play?(move)
		if move == :rock || move == :paper || move == :scissors
			return true
		end
		false
	end

	def computer_play
		[:scissors, :rock, :paper].sample
	end

	def won?
		if @move == :rock && @comp == :scissors
			return true
		elsif @move == :scissors && @comp == :paper
			return true
		elsif @move == :paper && @comp == :rock
			return true
		else 
			false
		end
	end

	def tied?
		if @move == @comp
			return true
		end
		false
	end

	def lost?
		if (@move == :rock && @comp == :paper) || (@move == :paper && @comp == :scissors) || (@move == :scissors && @comp == :rock)
			return true
		end
		false
	end

	class PlayTypeError < StandardError
  end

end
