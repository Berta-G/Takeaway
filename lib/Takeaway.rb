require 'twilio-ruby'

class Takeaway

	def initialize(dishes)
		@menu = dishes
	end

	attr_reader :menu

	def print_menu
		menu_header
		menu.each {|dish| dish.print}
		menu_footer
	end

	def menu_header
		puts "MENU".center(80)
		printf "%30s %30s \n", "DISH", "PRICE"
		
	end

	def menu_footer
		puts "="*80
	end

	

end