class Product < ApplicationRecord
	after_create :save_categories
	has_attached_file( :picture,
      styles: {medium: "600x400", thumb: "300x200"},
      default_url: "/images/:style/missing_product.jpg",
      default_style: :medium,
      :storage => :s3,
      :path => "/images/products/product_:product_id/:style/product.:extension"
 )
  validates_attachment_content_type :imagen, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png)$/, :message => 'file type is not allowed (only jpeg/png/jpg images)'


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
