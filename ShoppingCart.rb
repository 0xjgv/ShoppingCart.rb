class ShoppingCart
  @grandtotal = 0

  def initialize(price, quantity)
    @price = price
    @quantity = quantity
  end

  def total 
      @total = @price * @quantity
    puts @total
  end

      @grandtotal += @total * 0.95
      return @grandtotal
    end
  end
end

class Fruits < ShoppingCart
  def discount
    @total = (@price * 0.9) * @quantity
    puts @total
  end 
end

class Houseware < ShoppingCart
  def discount
    if @price > 100
      @total = (@price * 0.95) * @quantity
      puts @total
    else
      @total = @price * @quantity
      puts  @total
    end
  end
end

class Other < ShoppingCart
end

bananas = Fruits.new 10, 1
orange_juice = Fruits.new 10, 1
vacumm_cleaner = Houseware.new 150, 1
rice = Other.new 1, 1
anchovies = Other.new 2, 1

bananas.discount
orange_juice.total
vacumm_cleaner.discount

Fruits.grandtotal


