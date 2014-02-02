require 'twilio-ruby'
require 'time'

class Takeaway

	ACCOUNT_SID = "ACe3d5c93351424dc38b23ba6d175efb82"
	AUTH_TOKEN = "c262a857500dada1189b61752ef2fc3e"
	DEFAULT_WAITING_TIME = 3600 # in seconds

	def initialize(initial_values = {})
		@menu 				= initial_values.fetch(:menu, nil)
		@sender				= initial_values.fetch(:sender, nil)
		@waiting_time = DEFAULT_WAITING_TIME
	end

	attr_accessor :menu, :sender, :waiting_time

	def list_menu
		menu.to_s
	end

	def confirm_order(order)
		valid_order = order.lines.count == order.total_lines 
		raise "Incorrect order" if !valid_order
		send_text if sender && order.phone_number
	end

	def text_body
			"Your order has been received and it is being prepared. It will be delivered by #{delivery_time(Time.now)}"
		end

	def delivery_time(current_time)
		(current_time - waiting_time).strftime '%H:%M'
	end
	
	private
	def send_text
		sender.send_text('+447720916582', text_body)
	end
	
end