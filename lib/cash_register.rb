
class CashRegister

    attr_accessor :total, :discount, :quantity, :all_items, :last_item


    def initialize(discount=0)
        @total = 0
        @discount = discount
        @all_items = []
        @last_item = 0
    end

    def add_item(title, price, quantity=1)
        self.total += (price * quantity)
        quantity.times do 
            @all_items.push(title)
            @last_item = price
        end
    end

    def apply_discount
        if @discount != 0
            @total = @total * (100 - @discount) / 100
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @all_items
    end

    def void_last_transaction
        @total -= @last_item
    end

end