class AddValueToItems < ActiveRecord::Migration
  def change
    add_column :items, :value, :decimal
    add_column :items, :total, :decimal
  end
end
