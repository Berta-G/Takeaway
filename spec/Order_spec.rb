require './lib/Order'

describe "Order" do

	context "Initialize" do
		it "sets lines to empty array and populates the phone number if present" do
			order = Order.new("0")
			expect(order.phone_number).to eq("0")
			expect(order.lines).to eq([])
		end
		it "sets lines to empty array and the phone to nil if number not present" do
			order = Order.new
			expect(order.phone_number).to eq(nil)
			expect(order.lines).to eq([])
		end
	end
	context "Functionalities" do
		let(:order) {Order.new}

		it "can add a line" do
			line = double :line
			order.add_line(line)
			expect(order.total_lines).to eq(1)
		end
		it "can be sent to a takeaway" do
			takeaway = double :takeaway	
			expect(takeaway).to receive(:confirm_order)
			order.send(takeaway)
		end
	end
end