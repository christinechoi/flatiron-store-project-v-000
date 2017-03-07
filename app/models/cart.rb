class Cart < ActiveRecord::Base

  has_many :items, through: :line_items
  has_many :line_items, dependent: :destroy
  belongs_to :user


  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    return total
  end

  def add_item(new_item_id)
    @line_item = LineItem.new
    @line_item.item_id = new_item_id
    @line_item.cart_id = self.id
    if self.items.include?(@line_item.item)
      @line_item = self.line_items.find_by(item_id: new_item_id)
      @line_item.quantity = @line_item.quantity + 1
      @line_item.save
    else
      @line_item = LineItem.new(item_id: new_item_id, cart_id: self.id, quantity: 1)
    end
    @line_item
  end

  def checkout
    self.line_items.collect do |line_item|
      @item = Item.find_by(id: line_item.item_id)
      @item.inventory = @item.inventory - line_item.quantity
      @item.save
    end
    self.status = "submitted"
  end

end
