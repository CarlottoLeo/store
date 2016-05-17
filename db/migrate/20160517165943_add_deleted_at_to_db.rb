class AddDeletedAtToDb < ActiveRecord::Migration
  def change
    add_column :users,    :deleted_at, :datetime
    add_index :users,     :deleted_at

    add_column :products, :deleted_at, :datetime
    add_index :products,  :deleted_at

    add_column :orders,   :deleted_at, :datetime
    add_index :orders,    :deleted_at
  end
end
