require 'pry'

class CashRegister

  attr_accessor :total, :discount, :price

def initialize(discount = nil)
  @total = 0
  @discount = discount
end

def add_item(item, price, quantity = 1)
  @price ||= {}
  @price[item] = price
  @items ||= []
  @items.concat([item]*quantity)
  sum = price * quantity
  @total += sum
end

def apply_discount
  if @discount == nil
  "There is no discount to apply."
  else
    @total *= (100 - @discount) * 0.01
"After the discount, the total comes to $#{@total.to_i}."
end
end

def items
@items
end

def void_last_transaction
cost = @price[@items.last]
@total -= cost
end

end
