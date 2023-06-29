class Number
    def initialize(num)
        @num = num
    end

    def num
        return @num
    end

    def add(another_Number)
        return Number.new(@num + another_Number.num)
    end

    def sub(another_Number)
        return Number.new(@num - another_Number.num)
    end
end

class MyNumber < Number
    def ultimate_add(number_instance)
        return Number.new(@num + number_instance.num + 999)
    end

    def clear
        @num = 0
    end
end