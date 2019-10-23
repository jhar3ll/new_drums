class NewDrums::Item 
 attr_accessor :name, :description, :url 
 
  def self.today 
    
   self.scrape_items
   end 
   
  
  
  def self.scrape_items
    items = []
    items << self.scrape_popads
    
    return items
 end
 
 
  def self.scrape_popads
    doc = Nokogiri::HTML(open("https://www.popads.net/"))
    
  
    item = self.new
    item.name = doc.search("div.dark.bold").first.text.strip
    item.description = doc.search("div.spaced").first.text.strip
    item.url = doc.search("a.dark").first.attr("href")
    
    return item
  end
end 
