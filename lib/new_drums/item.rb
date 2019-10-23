class NewDrums::Item 
 attr_accessor :name, :price, :url 
 
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
    item.name = doc.search("div.blog_item").text
    item.url = doc.search("a.href")
    return item
  end
end 
