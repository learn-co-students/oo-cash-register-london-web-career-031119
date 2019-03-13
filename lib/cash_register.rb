class CashRegister

  attr_accessor :total
  attr_reader :discount


  
  def initialize (discount = 0)
    @discount = discount
    @items = []
    @total = 0
  end

  def add_item (title, price, quantity=1)
    for item in 1..quantity
      @items << {title => price}
    end
    @total += price * quantity
  end

  def apply_discount
    if discount != 0
      @total = @total * (100.0 - @discount)/100
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items.collect { |item| item.flatten.first }
  end

  def void_last_transaction
    @total -= @items.last.values.first
    @items.pop
  end

end
