require './lib/Takeaway'

describe "Takeaway" do 
	let(:menu) {double :menu}
	let(:sender) {double :sender}
	let(:takeaway) {Takeaway.new({:menu => menu, :sender => sender})}	
	let(:takeaway_no_data) {Takeaway.new}
	
	context "Initialize" do

		it "sets the waiting time to the default = 1 hour" do
			expect(takeaway.waiting_time).to eq(3600)
		end

		it "sets to nil menu and sender if not passed" do
			expect(takeaway_no_data.menu). to be(nil)
			expect(takeaway_no_data.sender).to be(nil)
		end			

		it "can initialize the menu and the sender if passed" do	
			expect(takeaway.menu).to eq(menu)
			expect(takeaway.sender).to eq(sender)
		end
	end

	context "Functionalities" do

		let(:line) {double :line}
		let(:correct_order) {double :order, :total_lines => 1, :lines => [line], :phone_number => "0"}

		it "lists the menu" do			
				expect(takeaway.menu).to receive(:to_s).once
				takeaway.list_menu
		end

		it "raises an error if the total of items is not correct on the order" do
			wrong_order = double :order, :total_lines => 3, :lines => [line], :phone_number => "0"
			expect{takeaway.confirm_order(wrong_order)}.to raise_error
		end

		it "can send a text when a correct order is received" do
			expect(sender).to receive(:send_text)
			takeaway.confirm_order(correct_order)
		end

		it "wont send a text if no receiver phone number is present" do
			order_without_phone = double :order, :total_lines => 1, :lines => [line], :phone_number => nil
			expect(sender).not_to receive(:send_text)
			takeaway.confirm_order(order_without_phone)
		end

		it "wont send a text if no sender is present" do
			expect(sender).not_to receive(:send_text)
			takeaway_no_data.confirm_order(correct_order)
		end

		it "calculates the delivery time from the current time" do
			time = Time.new(2002, 10, 31, 2, 2, 2, "+02:00")
			expect(takeaway.delivery_time(time)).to eq("01:02")
		end

		it "creates the body of the text" do
			Takeaway.any_instance.stub(:delivery_time => "23:05")
			expect(takeaway.text_body).to eq("Your order has been received and it is being prepared. It will be delivered by 23:05")
		end
	
	end
	
end
