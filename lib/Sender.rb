require 'twilio-ruby'

class Sender 

	def initialize(sid=ENV["ACCOUNT_SID"], auth=ENV["AUTH_TOKEN"], number_from=ENV["NUMBER_FROM"])
		@twilio_client = Twilio::REST::Client.new sid, auth
		@number_from 	= number_from
	end

	attr_reader :twilio_client, :number_from

	def send_text(number_to, text_body)
		twilio_client.account.sms.messages.create(
		:from => number_from,
		:to => number_to, 
		:body => text_body)
	end

end