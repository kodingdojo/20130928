require 'minitest/spec'
require 'minitest/autorun'


class Pacman
		def goStraight
			true
		end
end

describe Pacman do
    describe "checks game start" do
        it "returns `true` when pacman go straight" do
            pacman = Pacman.new
            pacman.goStraight().must_equal true
       end
    end
   end
