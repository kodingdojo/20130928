require 'minitest/spec'
require 'minitest/autorun'

class PacmanField
    attr_accessor :map

    def initialize
        @map = [[".", ".", "."],
                [".", ".", "."],
                [".", ".", "."]]
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
end
