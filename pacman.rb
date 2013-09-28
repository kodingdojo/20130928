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
            :direction => :up
        }
    end

    def tick
        x = @state[:x]
        y = @state[:y]
        if (@state[:direction] == :up) && (!wall? :up)
            @state[:y] -= 1
            @map[y - 1][x] = "V"
            @map[y][x] = " "
        elsif (@state[:direction] == :left) && (!wall? :left)
            @state[:x] -= 1
            @map[y][x - 1] = ">"
            @map[y][x] = " "
        end
    end

    def wall? direction
        x = @state[:x]
        y = @state[:y]
        case direction
        when :left
            x - 1 <= 0
        when :right
            x + 1 >= 2
        when :up
            y - 1 <= 0
        when :down
            y + 1 >= 2
        end
    end

    def startGame
        @map[@state[:x]][@state[:y]] = "V"
    end

    def turnLeft
        if wall? :left
            @map[@state[:x]][@state[:y]] = ">"
            @state[:direction] = :left
        end
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
