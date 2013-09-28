require 'minitest/spec'
require 'minitest/autorun'

class PacMan
		attr_accessor :board
		
    def initialize initBoard
			@board = initBoard
    end

		def started?
			if @board ==  "....." \
										"....." \
										"....." \
										"....." \
										"....."
				true
			else
				false
			end
		end
end


describe PacMan do
    describe "checks game start" do
        it "returns `true` when the board is full of points" do
            pacman = PacMan.new("....." \
																"....." \
																"....." \
																"....." \
																".....")
            pacman.started?().must_equal true
        end

        it "returns `false` when the board is not full of points" do
            pacman = PacMan.new("....." \
																". ..." \
																"....." \
																"....." \
																".....")
            pacman.started?().must_equal false
        end
    end

end
