class Material < ApplicationRecord
	belongs_to :material_category
	belongs_to :picture, required: false
	has_many :comments, as: :commentable
end
