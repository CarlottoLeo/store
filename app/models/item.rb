class Item < ActiveRecord::Base
  def new(params)
    Item.create do |item|
      item.prodid = params[:prodid]

      item.save
    end
  end
end
