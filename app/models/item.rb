class Item < ActiveRecord::Base
  def new(params)
    Item.create do |item|
      item.prodid = params[:prodid]
      item.amount = params[:amount]
      
      item.save
    end
  end
end
