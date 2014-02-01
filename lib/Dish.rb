class Dish

NO_NAME = "No name given"
NO_PRICE = 0.00

def initialize(values={})
	@name = values.fetch(:name, NO_NAME)
	@price = values.fetch(:price, NO_PRICE)
end

attr_reader :name, :price

def to_s
	"#{name.ljust(30, ".")} £#{price.round(2)}"
end

end
