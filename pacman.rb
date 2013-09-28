require 'minitest/spec'
require 'minitest/autorun'

class PacMan
    def initialize initBoard
			@board = initBoard
    end

		def started?
			if board ==   "....." \
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
    end

end
