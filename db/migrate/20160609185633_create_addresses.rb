class CreateAddresses < ActiveRecord::Migration
  def change
    add_column :people, :address, :string
    add_column :people, :number, :integer
    add_column :people, :district, :string
    add_column :people, :country, :string
    add_column :people, :city, :string
    add_column :people, :cep, :string
    add_column :people, :state, :string
  end
end
