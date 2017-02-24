class Cart < ActiveRecord::Base
  has_many :items, through: :line_items
  has_many :line_items


  def total
    
    ary = self.items.map do |item|
      item.price
    end
    ary.inject {|x| sum + x }

    # binding.pry

  end


  def add_item(new_item_id)
    @line_item = LineItem.new(item_id: new_item_id)
    @line_item.cart_id = self.id 

    # @line_item.quantity = 0
    # @line_item.quantity = @line_item.quantity + 1
    
    # #getting error for above two lines:
    #    undefined method `quantity' for 0:Fixnum
    #  # ./spec/models/cart_spec.rb:38:in `block (

    # binding.pry
    # @line_item
    
  end
  
end
