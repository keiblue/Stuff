class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :titulo,      null: false, default: ""
      t.string  :desc_corta,  default: ""
      t.text    :desc,        default: ""
      t.float   :precio,      default: ""
      t.float   :rating,      default: 2.5
      t.string  :tipo,        default: ""
      t.string  :marca,       default: ""
      t.string  :modelo,      default: ""
      t.integer :stock,       default: 0

      t.timestamps
    end
  end
end
