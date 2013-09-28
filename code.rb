require "minitest/autorun"
require "minitest/spec"

class Pacman
  def game_end? (board)
    lines_with_dot = board.select { |e| e.include? "."  }
    return 'Continue' if lines_with_dot.length != 0
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