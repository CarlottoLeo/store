class AddOrderIdToProduct < ActiveRecord::Migration
  def up
    add_column :products, :order_id, :integer
  end

  def down
    remove_column :products, :order_id
  end
end
