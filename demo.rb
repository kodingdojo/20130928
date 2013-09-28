require 'minitest/spec'
require 'minitest/autorun'

class MyClass
    def showMe
        "me"
    end

    def raiseException positiveNumber
        if positiveNumber < 0
            raise ArgumentError, "must be positive"
        end
    end
end


describe MyClass do
    describe "#showMe" do
        it "returns 'me' when called showMe" do
            myClass = MyClass.new
            myClass.showMe().must_equal "me"
        end
    end

    describe "#showYou" do
        it "oetuhtnoehuthoeuh otehutnoheutnh " do
            myClass = MyClass.new
            proc {
                myClass.raiseException(5)
            }.must_raise ArgumentError
        end
    end
end
