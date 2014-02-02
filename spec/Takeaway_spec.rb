require './lib/Takeaway'

describe "Takeaway" do 
	let(:menu) {double :menu}
	let(:sender) {double :sender}
	let(:takeaway) {Takeaway.new(menu, sender)}	
	let(:takeaway_no_data) {Takeaway.new}
	
	context "Initialize" do

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
		let(:correct_order) {double :order, :total_lines => 1, :lines => [line], :phone_number => "0", :total_price => 5.50}

		it "lists the menu" do			
				expect(takeaway.menu).to receive(:to_s).once
				takeaway.list_menu
		end

		it "raises an error if the order is received empty" do
			order = double :order, :total_lines => 0
			expect{takeaway.receive_order(order)}.to raise_error
		end

		it "can send a text when a correct order is received" do
			expect(sender).to receive(:send_text)
			takeaway.receive_order(correct_order)
		end

		it "wont send a text if no receiver phone number is present" do
			order_without_phone = double :order, :total_lines => 1, :lines => [line], :phone_number => nil
			expect(sender).not_to receive(:send_text)
			takeaway.receive_order(order_without_phone)
		end

		it "wont send a text if no sender is present" do
			expect(sender).not_to receive(:send_text)
			takeaway_no_data.receive_order(correct_order)
		end

		it "calculates the delivery time from the current time" do
			time = Time.new(2002, 10, 31, 2, 2, 2, "+02:00")
			expect(takeaway.delivery_time(time)).to eq("01:02")
		end

		it "creates the body of the text" do
			Takeaway.any_instance.stub(:delivery_time => "23:05")
			expect(takeaway.text_body(correct_order)).to eq("Your order is £5.5. It is being prepared and will be delivered by 23:05")
		end
	
	end
	
end
