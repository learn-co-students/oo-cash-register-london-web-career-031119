require 'pry'

class CashRegister
  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def discount
    @discount
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    @total += quantity * price
    quantity.times{ |_| @items << {:title => title, :price => price}}
  end

  def apply_discount
    if @discount != 0
      percentage = ((100 - @discount) / 100.to_f)
      @total = (@total * percentage).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items.map{|item| item[:title]}
  end

  def void_last_transaction
    @total = @total - @items.last[:price]
  end
end