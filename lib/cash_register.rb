class CashRegister
attr_accessor :total, :basket, :discount, :lastitem
attr_reader


def initialize( discount = 0, total = 0)
  @total = total
  @basket = []
  @discount = discount
  @lastitem = 0
end

def total
  @total
end

def add_item (title, price, quantity = 1)
  @lastitem = price
  total_temp = 0
  real_price = price * quantity
  total_temp += real_price
  @total += total_temp
  quantity.times {@basket.push title}
  return total_temp

end

def apply_discount
  if (@discount != 0)
  temp_tot = @total
  temp_tot = temp_tot / 100
  temp_tot = temp_tot   * @discount
  @total = @total - temp_tot
  return "After the discount, the total comes to $#{@total}."
else
  return "There is no discount to apply."
end
end

def void_last_transaction
  @total = @total - @lastitem

end


def items
  return @basket

end
end
