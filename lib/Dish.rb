class Dish

def initialize(name="", price= 0.00)
	@name = name.capitalize
	@price = price.round(2)
end

attr_reader :name, :price

def to_s
	"#{name.ljust(30, ".")} £#{price.round(2)}"
end

end
