class Item < ActiveRecord::Base

  belongs_to :category
  has_many :line_items


  def self.available_items
    ary = []
    self.all.each do |item|
      ary << item if item.inventory > 0
    end
   ary
  end

end
