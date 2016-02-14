require_relative "todolist.rb"
# Creates a new todo list
list = TodoList.new("UdaciList")
# Add four new items
thing1 = Item.new("Become superhuman",list,"Tomorrow")
thing2 = Item.new("Learn how to fly",list,"2017:05:27")
thing3 = Item.new("Do laundry",list)
thing4 = Item.new("Make a cake",list)
	
# Print the list
list.print_list
# Delete the first item
list.delete_item(0)
# Print the list
list.print_list
# Delete the second item
list.delete_item(1)
# Print the list
list.print_list
# Update the completion status of the first item to complete
list.items[0].change_completion_status
# Print the list
list.print_list
# Update the title of the list
list.title = "My list"
# Print the list
list.print_list

TodoList.save_list(list,"new_list")

old_list = TodoList.load_list("old_list")
old_list.print_list	
old_list.how_am_i_doing