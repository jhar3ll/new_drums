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
    
    blog_items = []
    
    doc.search("div.blog_items").map do |blog_item|
    
    item = self.new
    item.name = blog_item.search("div.dark.bold").first.text.strip
    item.description = blog_item.search("div.spaced").first.text.strip
    item.url = blog_item.search("a.dark").first.attr("href")
    
     end 
    return item
  end
end 
