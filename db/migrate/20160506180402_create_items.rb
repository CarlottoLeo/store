class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.integer :prodid
      t.integer :order_id
      
      t.timestamps null: false
    end
  end

  def down
    drop_table :items
  end
end
