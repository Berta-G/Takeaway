require './lib/Sender'

describe "Sender" do

	it "raises an error if incorrect credentials are passed" do
		sender = Sender.new("wrong_sid")
		expect{sender.send_tex(ENV["PHONE_NUMBER"], "Body of the text")}.to raise_error
	end

	it "send a text if the correct credentials are given" do
		sender = Sender.new
		Twilio::REST::Client.any_instance.stub(:create => "Text sent")
		expect(sender.twilio_client).to receive (:create)
		sender.send_text(ENV["PHONE_NUMBER"], "Body of the text")
	end
end