require 'date'

class Item
  attr_accessor :name, :price #Esto sirve para acceder a ellos desde cualquier clases? o?

  def initialize(name, price) #quantity=1 en caso que no se haga un input de quantity.
    @name = name
    @price = price
  end

end

class Fruit < Item 
#If an item has a discount, it should be calculated by calling a discount method on that item.
#Fruits have no discount during weekdays but on weekends they have a 10% discount
  attr_accessor :discount
  
  def discount
    if (0..1).include?(Date.today.wday)
      @price *= 0.9
    else
      @price
    end
  end
  
end

class Houseware < Item
#Housewares have no discount unless their unit price is more than 100€ / $100. 
#In that case they have a 5% discount.
  attr_accessor :discount

  def discount
    if @price > 100
      @price *= 0.95
    else
      @price
    end
  end

end

class ShoppingCart
	attr_accessor :total_price

  def initialize #Quiero que tome el nombre del item y precio
  	@itemlist = []
  	@total_price = 0
  end

  def add(item) #Añade al array de @itemlist
    @itemlist << item
    @total_price += item.price
  end
  #When a customer has more than 5 items in their cart, they get a 10% discount for that purchase.
end

banana = Fruit.new "banana", 10
orange_juice = Fruit.new "orange_juice", 10
vacumm_cleaner = Houseware.new "vacumm_cleaner", 150
rice = Item.new "rice", 1
anchovies = Item.new "anchovies", 2

shop = ShoppingCart.new

shop.add(banana)
shop.add(orange_juice)
shop.add(vacumm_cleaner)
shop.add(rice)
shop.add(anchovies)

puts shop.total_price
