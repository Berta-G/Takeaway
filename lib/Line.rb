class Line

	DEFAULT_QUANTITY = 1

	def initialize(dish, quantity = DEFAULT_QUANTITY)
		@dish = dish
		@quantity = quantity
	end

	attr_reader :dish, :quantity
end