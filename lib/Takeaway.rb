
require 'time'

class Takeaway

	WAITING_TIME = 3600 # in seconds

	def initialize(menu=nil, sender=nil)
		@menu, @sender = menu, sender
	end

	attr_reader :menu, :sender

	def list_menu
		menu.to_s
	end

	def receive_order order 
		raise "Empty order" if order.total_lines == 0
		send_text(order) if sender && order.phone_number
	end

	def text_body(order)
			"Your order is £#{order.total_price}. It is being prepared and will be delivered by #{delivery_time(Time.now)}"
	end

	def delivery_time(current_time)
		(current_time - WAITING_TIME).strftime '%H:%M'
	end
	
	private
	def send_text(order)
		sender.send_text(order.phone_number, text_body(order))
	end
	
end