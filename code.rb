require "minitest/autorun"
require "minitest/spec"

class Pacman
  def game_end? (board)
    'End'
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
  end

end