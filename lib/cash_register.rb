require 'pry'

class CashRegister
  
  attr_accessor :discount, :total
  
 
def initialize (discount=0)
  @total = 0
  @discount = discount
  @items = []
end

def add_item (item,price,quantity=1)
  @total += price * quantity
  @last_transaction = price * quantity
  for i in 1..quantity
    @items << item
  end
end

def items
  @items
end

def apply_discount
  if @discount > 0
    @total = @total - (@total * @discount/100)
    "After the discount, the total comes to $#{@total}."
  else 
    "There is no discount to apply."
  end
end

def void_last_transaction
  @total -= @last_transaction
end

end