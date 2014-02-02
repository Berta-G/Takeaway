class Order

	def initialize(phone_number= nil)
		@lines = []
		@phone_number = phone_number
	end

	attr_accessor :phone_number, :lines

	def add_line(line)
		lines << line
	end

	def remove_line(line)
		lines.delete(line)
	end

	def total_lines
		lines.count
	end

	def send(takeaway)
		takeaway.confirm_order(self)
	end


end