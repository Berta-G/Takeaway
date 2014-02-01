require './lib/Takeaway'

describe "Takeaway" do 
	let(:dish1) {double :dish}
	let(:dish2) {double :dish}
	let(:center) {double :messages_center}
	let(:takeaway) {Takeaway.new({:dishes => [dish1, dish2], :messages_center => center})}
	
	context "Initialize" do
		it "initializes the menu array from the aray dishes" do	
			expect(takeaway.menu.size).to eq(2)
		end

		it "assigns the message_center of the takeaway" do
			expect(takeaway.messages_center). to eq(center)
		end
	end

	it "lists all the dishes and prices in the menu" do
			expect(dish1).to receive(:to_s).once
			expect(dish2).to receive(:to_s).once
			takeaway.list_menu
	end

	context "sending a text"  do 
		
		let(:time) 		{Time.new(2002, 10, 31, 2, 2, 2, "+02:00")}
		let(:order) 	{double :order}

		it "calculates the delivery time from the current time" do
			expect(takeaway.delivery_time(time)).to eq("01:02")
		end
		it "creates the body of the text" do
			Takeaway.any_instance.stub(:delivery_time => "23:05")
			expect(takeaway.text_body).to eq("Your order has been received and it is being prepared. It will be delivered by 23:05")
		end
		it "calls the method send_text when an order arrives" do
			expect(center).to receive(:send_text)
			takeaway.confirm_order(order)
		end
	end


		
end
