class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name_category
      t.string :color

      t.timestamps
    end
  end
end
