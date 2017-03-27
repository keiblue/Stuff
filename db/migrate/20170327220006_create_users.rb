class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :Nick
      t.string :email
      t.string :address
      t.string :Password
      t.integer :ZipCode
      t.string :phone

      t.timestamps
    end
  end
end
