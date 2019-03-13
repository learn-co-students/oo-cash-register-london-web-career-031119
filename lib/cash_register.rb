class CashRegister
attr_accessor :total, :discount, :title, :quantity

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    @title = title
    @quantity = quantity
    quantity.times do
      @items << title
    end
    @last_transaction = price
  end

  def apply_discount
    if @discount
      @total = @total - @total*(@discount/100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_transaction
  end

end
