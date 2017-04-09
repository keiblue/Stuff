class Category < ApplicationRecord
	validates :name_category , presence: true
	has_many :has_categories
	has_many :products, through: :has_categories
end
