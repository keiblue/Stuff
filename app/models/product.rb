class Product < ApplicationRecord
	after_create :save_categories

	has_attached_file(:picture,
      styles: {medium: "600x400", thumb: "300x200"},
      default_url: "/images/:style/missing_product.png",
      default_style: :medium,
      :storage => :s3,
      :path => "/images/products/product_:product_id/:style/product.:extension"
 )
 	Paperclip.interpolates :product_id  do |attachment, style|
	 attachment.instance.id
 	end
  validates_attachment_content_type :picture, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png)$/, :message => 'file type is not allowed (only jpeg/png/jpg images)'
	validates_attachment_size :picture, :in => 0.megabytes..1.megabytes

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
