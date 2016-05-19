class Item < ActiveRecord::Base
  belongs_to :order

  def new(params)
    Item.create do |item|
      item.prodid = params[:prodid]
      item.amount = params[:amount]
      item.value  = params[:value]
      item.total  = item.value * item.amount

      item.save
    end
  end
end
