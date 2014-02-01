require 'twilio-ruby'
require 'time'

class Takeaway

	ACCOUNT_SID = "ACe3d5c93351424dc38b23ba6d175efb82"
	AUTH_TOKEN = "c262a857500dada1189b61752ef2fc3e"
	DEFAULT_WAITING_TIME = 3600

	def initialize(options)
		@menu = options[:dishes]
		@messages_center = options[:messages_center]
		@waiting_time = options.fetch([:waiting_time], DEFAULT_WAITING_TIME)
	end

	attr_reader :menu, :messages_center, :waiting_time

	def list_menu
		menu.map {|dish| dish.to_s}
	end

	def confirm_order(order)
		send_text if messages_center
	end

	def text_body
			"Your order has been received and it is being prepared. It will be delivered by #{delivery_time(Time.now)}"
		end

	def delivery_time(current_time)
		(current_time - waiting_time).strftime '%H:%M'
	end
	
	private
	def send_text
		messages_center.send_text('+447720916582', text_body)
	end
	
end