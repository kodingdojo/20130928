require 'minitest/spec'
require 'minitest/autorun'


class Pacman
	attr_accessor = $direction
	$direction = :right
	def turnRight(direction)
	  true
	end
	def goesStraight
	    true
	end
	def canGo
	    true
	end
end

describe Pacman do
    describe "checks pacman can go" do
      it "return 'true' if pacman can go" do
	  pacman = Pacman.new
	  pacman.canGo().must_equal true
      end
    end
    describe "checks which direction pacman goes" do
        it "returns `true` when pacman goes straight" do
            pacman = Pacman.new
            pacman.goesStraight().must_equal true
       end
       it "returns 'true' when pacman turn right" do
	  pacman = Pacman.new
	  pacman.turnRight()
	  assert_equal $direction ,:down
       end
       
    end
   end
