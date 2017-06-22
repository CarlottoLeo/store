class CreateSalesmen < ActiveRecord::Migration[5.0]
  def change
    create_table :salesmen do |t|
      t.string :nome
      t.string :telefone
      t.string :email
      t.string :cargo
      t.string :crypted_password

      t.timestamps
    end
  end
end
