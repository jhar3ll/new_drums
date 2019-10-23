class NewDrums::Item 
 attr_accessor :name, :description, :url 
 
  def self.today 
    
   self.scrape_items
   end 
   
  
  
  def self.scrape_items
    items = []
    items << self.scrape_popads1
    items << scrape_popads2
    items << scrape_popads3
    
    
    return items
 end
 
 
  def self.scrape_popads1
    doc = Nokogiri::HTML(open("https://www.popads.net/"))
    
    item = self.new
    item.name = doc.search("div.dark.bold").first.text.strip
    item.description = doc.search("div.spaced").first.text.strip
    item.url = doc.search("a.dark").first.attr("href")
    
    return item
  end
  
  def self.scrape_popads2
    doc = Nokogiri::HTML(open("https://www.popads.net/"))
    
    item = self.new
    item.name = doc.search("div.dark.bold").text.strip
    item.description = doc.search("div.spaced").text.strip
    item.url = doc.search("a.dark").first.attr("href")
    
    return item
  end
  
  def self.scrape_popads3
    doc = Nokogiri::HTML(open("https://www.popads.net/"))
    
    item = self.new
    item.name = doc.search("div.dark.bold").text.strip
    item.description = doc.search("div.spaced").text.strip
    item.url = doc.search("a.dark").first.attr("href")
    
    return item
  end
end 
