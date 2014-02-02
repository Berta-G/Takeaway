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
		let(:takeaway) {double :takeaway}
		let(:line) {double :line}

		def insert_three_lines
			3.times {order.add_line(line)}
		end

		it "can add a line" do
			insert_three_lines
			order.add_line(line)
			expect(order.total_lines).to eq(4)
		end

		it "can delete a line" do
			insert_three_lines
			order.delete_line(line)
			expect(order.total_lines).to eq(0)
		end

		it "can be sent to a takeaway" do
			expect(takeaway).to receive(:confirm_order)
			order.send(takeaway)
		end

		it "raises an error if an empty order tries to be sent" do
			expect{order.send(takeaway)}.to raise_error
		end
			
	end
end