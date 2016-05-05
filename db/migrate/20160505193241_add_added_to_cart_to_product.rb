class AddAddedToCartToProduct < ActiveRecord::Migration
  def up
    add_column :products, :added_to_cart, :boolean
  end

  def down
    remove_column :products, :added_to_cart
  end
end
