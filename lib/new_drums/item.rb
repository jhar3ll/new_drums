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
    doc = Nokogiri::HTML(open("https://www.sweetwater.com/nowshipping/Drums"))
    
  
    item = self.new 
    item.name = doc.search("strong.product-block__title").text
    item.price = doc.search("#grid em.product__price").text
    
    return item
  end
end 
