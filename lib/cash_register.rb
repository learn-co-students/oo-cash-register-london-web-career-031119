class CashRegister
  attr_accessor :total, :discount, :title, :last_transaction
  
  def initialize (discount=nil)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end 
  def add_item (title, price, quantity=1)
    @total += quantity*price
    @title = title
    quantity.times do
      @items << title
    end
    @last_transaction = quantity*price
  end 
  

  
  def apply_discount 
    if @discount  == nil 
      "There is no discount to apply."
    else 
      @total = @total - @total*(@discount/100.0) 
        "After the discount, the total comes to $#{@total.to_i}."
    end
  end
def items
@items
end 

def void_last_transaction
 @total =  @total - @last_transaction
end 


end
