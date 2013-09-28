require "minitest/autorun"
require "minitest/spec"

class Pacman
  def game_end? (board)
    return 'Continue' if board[0].include?('.') or board[1].include?('.') or board[2].include?('.')
    return 'End'
  end
end

describe Pacman do
  before do
    @game = Pacman.new
  end

  describe "#game_end?" do
    it "return 'End'" do
      board = ["v   ", "   ", "   "]
      @game.game_end?(board).must_equal 'End'
    end

    it "return 'End'" do
      board = ["   ", " v ", "   "]
      @game.game_end?(board).must_equal 'End'
    end

    it "return 'Continue'" do
      board = ["v.  ", "   ", "   "]
      @game.game_end?(board).must_equal 'Continue'
    end

    it "return 'Continue'" do
      board = ["v  ", "   ", "..."]
      @game.game_end?(board).must_equal 'Continue'
    end
  end
end