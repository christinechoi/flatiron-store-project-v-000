class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item



  def create
    # binding.pry
    LineItem.new
  end



end
