require './lib/Takeaway'
require './lib/Sender'
require './lib/Order'
require './lib/Line'
require './lib/Menu'
require './lib/Dish'

ACCOUNT_SID = ENV["ACCOUNT_SID"]
AUTH_TOKEN = ENV["AUTH_TOKEN"]


def create_takeaway
	@menu = Menu.new
	@sender = Sender.new(ACCOUNT_SID, AUTH_TOKEN)
	@order = Order.new
	dishes = [Dish.new("Fried chicken", 5.50), 
						Dish.new("Special rice" , 4.00),
						Dish.new("Sushi moriwase", 14.25)]
	dishes.each {|dish| @menu.add_dish(dish)}
	@takeaway = Takeaway.new(@menu, @sender)
end

def complete_order
	puts "press Enter twice when order is ready"
	puts "Enter: < dish_name, quantity > and press enter " 
	
	loop do
		input_name, input_quantity = gets.chomp().split(",")
		break if input_name.nil?
		input_dish = @menu.dishes.select{|dish| dish.name == input_name.capitalize}
		@order.add_line(Line.new(input_dish, input_quantity))
	end

	puts "Order sent:"

	@takeaway.receive_order(@order)
end


def start_takeaway
	create_takeaway
	puts @takeaway.menu.to_s
	complete_order
	@takeaway.receive_order(@order)
end

start_takeaway
