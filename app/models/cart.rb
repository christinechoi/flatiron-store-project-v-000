class Cart < ActiveRecord::Base
  has_many :items, through: :line_items
  has_many :line_items
  belongs_to :user


  def total
    ary = self.items.map do |item|
      quantity = self.line_items.find(item.id).quantity
      item.price * quantity
    end
    a = ary.inject(0) {|sum, x| sum + x }
    a.round(2)
  end

  def add_item(new_item_id)
    @line_item = LineItem.new
    @line_item.item_id = new_item_id
    @line_item.cart_id = self.id
    #if cart already has one
    if self.items.include?(@line_item.item)
      @line_item = self.line_items.find_by(item_id: new_item_id)
      @line_item.quantity = @line_item.quantity + 1
      @line_item.save
    #if cart does not have one
    else
      @line_item = LineItem.new(item_id: new_item_id, cart_id: self.id, quantity: 1)
    end
    @line_item
  end

end
