
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
	def delete_item(number_in_array)
		@items.delete_at(number_in_array)
	end
	def print_list
		print "\n"
		print "------------------------ \n"
		print "\t#{@title} \n"
		print "------------------------ \n"

		items.each do |item|
			item.print_item
		end
	end
	def how_am_i_doing
		count_all_thing = 0.0
		count_things_done = 0.0
		@items.each do |thing| 
			if thing.completed? == true
				count_things_done+=1
				count_all_thing+=1
			else
				count_all_thing+=1
			end
		end
		success_ratio = count_things_done/count_all_thing
		if success_ratio < 0.5
			puts "Get up, you lazy bastard!"
		elsif (success_ratio >= 0.5) && (success_ratio < 1.0) 
			puts "You're doing well! Keep up the good work"
		else
			puts "Wow! Are you a robot or something?"
		end
	end
	def self.save_list(list_to_save,f_to_save)
		File.open(f_to_save, 'w+') do |f|  
  		Marshal.dump(list_to_save, f)  
		end  
	end
	def self.load_list(name_of_file)
		File.open(name_of_file)do |f|  
 		Marshal.load(f)  
		end  
	end
end


class Item
	attr_reader :description 
	attr_accessor :completed_status
	def initialize(item_description,todolist, due_date = "#{Time.now.strftime("%Y:%m:%d")} ")
		@description = item_description
		@completed_status = false
		@due_date = due_date
		todolist.items.push(self)
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
		completion_mark = "| |"
		if @completed_status == true
			completion_mark = "|✓|"
		end
		print "#{completion_mark} #{@due_date} #{@description} \n"
	end

end
 list = TodoList.new("Secret to do list")
# Add four new items
thing1 = Item.new("Destabilize world economy",list,"Sunday")
thing2 = Item.new("Learn how to play flute",list)
thing3 = Item.new("Conquer the world",list)
thing4 = Item.new("Watch Rocky",list)

TodoList.save_list(list,"old_list")q