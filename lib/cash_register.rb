require 'pry'

class CashRegister

    attr_reader :discount, :items

    attr_accessor :total

    def initialize (discount = 0.0)
        @total = 0.0
        @discount = discount
        @last_price = 0.0
        @items = []
        # binding.pry
    end

    def add_item(title, price, quantity = 1)
        quantity.times { @items << title }
        @last_price = price.to_f * quantity
        @total = @total + price.to_f * quantity.to_f
    end

    def apply_discount()
        # binding.pry
        
        @total = @total * (1.0 - @discount.to_f / 100) if @discount != 0
        # binding.pry
        discount != 0 ? "After the discount, the total comes to $#{@total.to_i}." : "There is no discount to apply."
    end

    def void_last_transaction()
        @total = @total - @last_price
    end


end 
