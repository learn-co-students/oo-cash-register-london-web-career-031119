require 'pry'

class CashRegister

  attr_accessor :discount, :total, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []

  end

  # accepts a title and a price and increases the total
  # accepts an optional quantity
  # doesn't forget about the previous total
  def add_item(title, price, quantity = 1)
    @total += price * quantity

    # adds item to the items list
    quantity.times {@items << title}
    # create a new instance variable so we can use it later to substract the last item from the total
    @last_item = [title, price, quantity]

  end


  # return There is no discount to apply.
  def apply_discount
    # if the cash register was not initialized with an employee discount
    if discount == 0
      "There is no discount to apply."
    else
      # the cash register was initialized with an employee discount
      # applies the discount to the total price
      # returns success message with updated total
      @total *= (100 - discount).to_f / 100
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  # subtracts the last transaction from the total
  def void_last_transaction
    transaction_price = @last_item[1]
    transaction_quantity = @last_item[2]

    @total -= transaction_price * transaction_quantity
    transaction_quantity.times { @items.pop }
  end


end

# cashier1 = CashRegister.new(20)
# cashier1.total = 100
# cashier1.add_item("book", 5.00, 3)
# cashier1.items
# cashier1.void_last_transaction
