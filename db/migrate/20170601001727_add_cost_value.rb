class AddCostValue < ActiveRecord::Migration[5.0]
  def change
    change_table :products do |t|
      t.float :precio_compra, default: 0
      t.float :precio,        default: 0
    end
  end
end
