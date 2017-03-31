class User < ApplicationRecord
	validates :Name , presence: true
	validates :Nick , presence: true, uniqueness: true
	validates :email , presence: true, uniqueness: true

end
