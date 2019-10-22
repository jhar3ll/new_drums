class NewDrums::Item 
 attr_accessor :name, :price, :url 
 
  def self.today 
    
    self.scrape_items
   end 
   
   def self.scrape_items
     items = []
     
     items << self.scrape_sweetwater
    
     
     
     return items
  end 
  
  def self.scrape_sweetwater
    doc = Nokogiri::HTML(open("https://sweetwater.com"))
    binding.pry
 end
end 
