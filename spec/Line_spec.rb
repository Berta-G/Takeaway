require './lib/Line'

describe "Line" do
	
	let(:dish) {double :dish}

	context "Initialize" do
		it "initializes dish and quantity to the given values" do
			line = Line.new(dish, 3)
			expect(line.dish).to eq(dish)
			expect(line.quantity).to eq(3)
		end

		it "sets quantity to default 1 if not present" do
			line = Line.new(dish)
			expect(line.quantity).to eq(1)
		end
	end
end
