class CashRegister

    attr_accessor :total, :discount, :items, :final_transaction, :price

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
        
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times do
            items << title
        end
        @final_transaction = price
    end
    
    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total *= (100 - discount).to_f / 100
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        @total -= @final_transaction
    end
end




