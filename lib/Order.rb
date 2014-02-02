class Order

	def initialize(phone_number= nil)
		@lines = []
		@phone_number = phone_number
	end

	attr_accessor :phone_number, :lines

	def add_line(line)
		lines << line
	end

	def delete_line(line)
		lines.delete(line)
	end

	def total_lines
		lines.count
	end

	def total_price
		lines.inject(0) {|total, line| total + line.price * line.quantity}
	end

	def send(takeaway)
		raise "Empty order, cannot be sent" if total_lines == nil
		takeaway.confirm_order(self)
	end

end