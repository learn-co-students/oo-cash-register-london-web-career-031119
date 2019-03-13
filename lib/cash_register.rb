require "pry"

class CashRegister

  attr_accessor :total, :discount, :last_transaction, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(name, price, quantity = 1)
    @total += price * quantity
    quantity.times do
      @items << name
    end
    @last_transaction = [name, price, quantity]
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total *= (100 - discount).to_f / 100
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def void_last_transaction
    item_name = @last_transaction[0]
    item_price = @last_transaction[1]
    item_quantity = @last_transaction[2]

    @total -= item_price * item_quantity
    item_quantity.times { @items.pop }
  end

end
