class NewDrums::CLI 

  def call 
    list_items
    menu
  end 

  def list_items
    puts "This week's blog posts! \n\n"
    @items = NewDrums::Item.today 
    @items.each.with_index(1) do |item, index|
      puts "#{index}. - #{item.name} \n "
    end
  end  

   def menu 
     input = nil 
     while input != "exit"
       puts "Enter the number of the blog you'd like more info on, type \"list\" for the list of blogs or type \"exit\" to exit."
       input = gets.strip.downcase
       
       if input.to_i > 0 && input.to_i < 4  
         the_item = @items[input.to_i - 1]
        puts "#{the_item.name}\n\n#{the_item.description} \n\nurl: (#{the_item.url})\n\n"
      elsif input == "list"
         list_items
       elsif input == "exit"
        goodbye
      else 
         puts "Invalid Input!"
       end 
     end 
   end 

   def goodbye
     puts "See you next week for more blogs!"
   end 
 end 
 
