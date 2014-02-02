require './lib/Order'

describe "Order" do

	context "Initialize" do
		it "sets lines to empty array and populates the phone number if present" do
			order = Order.new("0")
			expect(order.phone_number).to eq("0")
			expect(order.lines).to eq([])
		end
		it "sets lines to empty array and the phone to default if number not present" do
			order = Order.new
			expect(order.phone_number).to eq('+447720916582')
			expect(order.lines).to eq([])
		end
	end
	context "Functionalities" do
		let(:order) {Order.new}
		let(:takeaway) {double :takeaway}
		let(:line1) {double :line, :price => 3.00, :quantity => 1}
		let(:line2) {double :line, :price => 2.00, :quantity => 3}
		let(:line3) {double :line, :price => 5.50, :quantity => 2}

		def insert_three_lines
			order.add_line(line1)
			order.add_line(line2)
			order.add_line(line3)
		end

		it "knows how many lines the order has" do
			insert_three_lines
			expect(order.total_lines).to eq(3)
		end

		it "know the total price of the order" do
			insert_three_lines
			expect(order.total_price).to eq(20.00)
		end

		it "can add a line" do
			insert_three_lines
			expect(order.lines).to eq([line1, line2, line3])
		end
			
	end
end