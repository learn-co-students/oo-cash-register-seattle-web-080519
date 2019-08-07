require 'pry'
class CashRegister
    attr_accessor :total, :title, :price, :quantity
    attr_reader :discount
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @item = []
    end
    def add_item(title, price, quantity = 1)
        @title = title
        @price = price
        @quantity = quantity
        quantity.times {@item << title}
        @total += @price * quantity
    end

    def apply_discount
        #binding.pry
        if @discount == 0 
            return "There is no discount to apply."
        end
        discount = @total *@discount / 100.0
        @total -= discount
        "After the discount, the total comes to $#{@total.round}."
    end
    def items
       @item
    end
    def void_last_transaction
        @total -= @price * @quantity
    end

end