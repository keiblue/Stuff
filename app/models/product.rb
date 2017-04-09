class Product < ApplicationRecord
	after_create :save_categories

	has_attached_file :picture, styles: { medium: "600x400>", thumb: "300x200>" }, default_url: "/images/:style/missing_product.png"
 	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/



 	def categories=(value)
 		@categories = value
 	end



 	private

 	def save_categories
 		@categories.each do |category_id|
 			HasCategory.create(category_id: category_id, product_id: self.id)
 		end		
 	end
end
