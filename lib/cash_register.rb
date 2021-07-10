require 'pry'

class CashRegister

  attr_accessor :total, :discount, :quantity, :title, :price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @all = []
    @last_price = 0
  end

  def add_item(title,price,quantity=1)
    @total += (price*quantity)
    quantity.times do
      @all << title
      @last_price = price
    end
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total = @total * (100-@discount)/100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @all
  end

  def void_last_transaction
    @total -= @last_price
  end

end
