require 'minitest/spec'
require 'minitest/autorun'

class PacmanField
    attr_accessor :map

    def initialize
        @map = [[".", ".", "."],
                [".", ".", "."],
                [".", ".", "."]]
    end

    def tick
        @map[1][1] = " "
        @map[1][0] = ">"
    end

    def startGame
        @map[1][1] = "V"
    end

    def turnLeft
        @map[1][1] = ">"
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
end
