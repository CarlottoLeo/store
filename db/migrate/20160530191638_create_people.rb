class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :cpf, unique: true

      t.timestamps null: false
    end
  end
end
