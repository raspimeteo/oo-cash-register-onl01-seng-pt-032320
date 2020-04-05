
class CashRegister
  attr_accessor :total, :discount
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, quantity = 1)
    @total += price * quantity
    counter = 0
    while counter < quantity
      @items << item
         counter += 1
    end
    @last_item = [item, price, quantity]
  end
  
  def apply_discount
    if @discount > 0
    @total = @total * (100 - @discount) / 100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - (@last_item[1]*@last_item[2])
    @items.pop(@last_item[2])
  end
  
  end
  