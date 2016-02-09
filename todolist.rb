
class TodoList
	attr_reader :items
	attr_accessor :title
	def initialize(list_title)
		@title = list_title
		@items = Array.new
	end
	def change_title(new_title)
		@title = new_title
	end
	def add_item(new_item)
		item = Item.new(new_item)
		@items.push(item)
	end
	def delete_item(number_in_array)
		@items.delete_at(number_in_array)
	end
	def print_list
		items.each do |item|
			item.print_item
		end
	end
end


class Item
	attr_reader :description 
	attr_accessor :completed_status
	def initialize(item_description)
		@description = item_description
		@completed_status = false
	end
	def change_completion_status
		if @completed_status == false
			@completed_status = true
		else 
			@completed_status = false
		end
	end
	def completed?
		if @completed_status == false
			return false
		else
			return true
		end
	end
	def print_item 
		print "Description: #{@description}\n"
		print "Completed? #{@completed_status}\n"
	end

end

list = TodoList.new ("Greg's list")

list.add_item("do dishes")
list.add_item("do laundry")

list.print_list


