class NewDrums::Item 
 attr_accessor :name, :description, :url, 
 
  def initialize(name, description, url)
    @name = name
    @description = description
    @url = url 
  end 
  
  def self.today 
    self.scrape_popads
   end 
   
  def self.scrape_popads
    @@items = []
    
    doc = Nokogiri::HTML(open("https://www.popads.net/blog"))
    doc.search("div.outter").each do |blog|
      
      item = self.new
      item.name = blog.search("h2.entry-title").first.text.strip
      item.description = blog.search("div.entry-content").first.text.strip
      item.url = blog.search("a").attr("href")
      
      @@items << item 
    end 
    return @@items.first(3)
  end
  
   #search through items and find any items whose title contains the word
  def self.search_by_word(word)
   search_array = @@items.name.find_all { |i| i == word}
   
    return search_array
  end 
end 

# refactor to use class variables, instance variables, and an initialize method  

# review scope and class vs instance methods 

# refactor so that the user sees the entire blogpost title *DONE*


