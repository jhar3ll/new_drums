class NewDrums::Item 
 attr_accessor :name, :description, :url 
 
  def self.today 
    
   self.scrape_popads
   end 
   
  def self.scrape_popads
    items = []
    doc = Nokogiri::HTML(open("https://www.popads.net/"))
    doc.search("div.blog_item").each do |blog|
      
      item = self.new
      item.name = blog.search("div.dark").first.text.strip
      item.description = blog.search("div.spaced").first.text.strip
      item.url = blog.search("a.dark").first.attr("href")
      
      items << item 
    end 
    return items
  end
  
  def self.search_by_word(word)
    #search through items and find any items whose title contains the word
  end 
end 

# refactor to use class variables, instance variables, and an initialize method  

# review scope and class vs instance methods 

# refactor so that the user sees the entire blogpost title 


