class NewDrums::Item 
 attr_accessor :name, :price, :url 
 
  def self.today 
     item_1 = self.new 
     item_1.name = "Tama boom stand 2-pack"
     item_1.price = "$79.99"
     item_1.url = "https://www.sweetwater.com/store/detail/HC03BWX2--tama-standard-boom-stand-2-pack"

     item_2 = self.new 
     item_2.name = "Mike Johnston groove bell"
     item_2.price = "$49.99"
     item_2.url = "https://www.sweetwater.com/store/detail/MJ-GB--meinl-percussion-mike-johnston-groove-bell-signature-cowbell"

     [item_1, item_2]
   end 

 end 
