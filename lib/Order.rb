class Order

	def initialize(phone_number= ENV["PHONE_NUMBER"])
		@lines = []
		@phone_number = phone_number
	end

	attr_reader :phone_number, :lines

	def add_line(line)
		lines << line
	end

	def total_lines
		lines.count
	end

	def total_price
		lines.inject(0) {|total, line| total + line.price * line.quantity}
	end

end