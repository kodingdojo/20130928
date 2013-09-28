require 'minitest/spec'
require 'minitest/autorun'

class PacmanField
    attr_accessor :map

    def initialize
        @map = [[".", ".", "."],
                [".", ".", "."],
                [".", ".", "."]]
    end

    def startGame
        @map[1][1] = "^"
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
        @field.map[1][1].must_equal "^"
    end

    it "turn to the left" do
        @field.startGame
        @field.turnLeft
        @field.map[1][1].must_equal ">"
    end
end
