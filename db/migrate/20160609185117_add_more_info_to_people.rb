class AddMoreInfoToPeople < ActiveRecord::Migration
  def change
    add_column :people, :birth_date, :datetime
    add_column :people, :email, :string
    add_column :people, :profession, :string
    add_column :people, :gender, :integer
    add_column :people, :marital_status, :string
  end
end
