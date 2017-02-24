class Cart < ActiveRecord::Base
  has_many :items, through: :line_items
  has_many :line_items
  belongs_to :user

  def total
    ary = self.items.map do |item|
      item.price
    end
    ary.inject(0) {|sum, x| sum + x }
  end


  def add_item(new_item_id)
    #if adding an item to cart, and that item is already in cart,
    # update existing item instead of making brand new one

    #item to be added to cart
    @item = Item.find_by(id: new_item_id)
    #if cart already has one
    if self.items.include?(@item)
      @line_item = self.line_items.find_by(item_id: new_item_id)
      @line_item.quantity = @line_item.quantity + 1
      @line_item
    else
      @line_item = LineItem.new(item_id: new_item_id, cart_id: self.id, quantity: 1)
    end
  end
end
