class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :name
      t.integer :number
      t.string  :district
      t.string  :country
      t.string  :country_short
      t.string  :cep
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
