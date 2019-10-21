class NewDrums::CLI 

  def call 
    list_items
    menu
    goodbye
  end 

  def list_items
    puts "Today's new arrivals"
    @items = NewDrums::Item.today 
    @items.each.with_index(1) do |item, index|
      puts "#{index}. - #{item.name} - #{item.price}"
    end
  end  

   def menu 
     input = nil 
     while input != "exit"
       puts "Enter the number of the item you'd like more info on, type \"list\" for the list of items or type \"exit\" to exit."
       input = gets.strip.downcase
       
       if input.to_i > 0  
         the_item = @items[input.to_i - 1]
        puts "#{the_item.name} - #{the_item.price}"
      elsif input == "list"
         list_items
       else 
         puts "Invalid Input!"
       end 
     end 
   end 

   def goodbye
     puts "See you tomorrow for more new arrivals!"
   end 
