require 'minitest/spec'
require 'minitest/autorun'

class PacmanField
    attr_accessor :map

    def initialize
        @map = [[".", ".", "."],
                [".", ".", "."],
                [".", ".", "."]]
        @state = {
            :x => 1,
            :y => 1,
            :direction => "V"
        }
    end

    def tick
        if @state[:direction] == "V"
            @state[:x] = 0
        end
    end

    def startGame
        @map[@state[:x]][@state[:y]] = "V"
    end

    def turnLeft
        @map[@state[:x]][@state[:y]] = ">"
    end
end

describe PacmanField do
    before do
        @field = PacmanField.new
    end

    it "starts with a map full of dots" do
        @field.map.each { |row|
            row.each { |cell|
                cell.must_equal "."
            }
        }
    end

    it "has pacman in the middle when the game starts" do
        @field.startGame
        @field.map[1][1].must_equal "V"
    end

    it "turn to the left" do
        @field.startGame
        @field.turnLeft
        @field.map[1][1].must_equal ">"
    end

    it "moves one step to the left" do
        @field.startGame
        @field.turnLeft
        @field.tick
        @field.map[1][0].must_equal ">"
        @field.map[1][1].must_equal " "
    end

    it "stops when hit wall" do
        @field.startGame
        @field.turnLeft
        @field.tick
        @field.tick
        @field.map[1][0].must_equal ">"
        @field.map[1][1].must_equal " "
    end

    it "moves forward" do
        @field.startGame
        @field.tick
        @field.map[0][1].must_equal "V"
        @field.map[1][1].must_equal " "
    end
end
