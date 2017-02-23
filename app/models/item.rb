class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items


  def self.available_items
    # binding.pry
    a = []
    self.all.each do |item| 
      a << item if item.inventory > 0
    end
    a
  end

end
