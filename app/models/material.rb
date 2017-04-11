class Material < ApplicationRecord
	belongs_to :material_category
	belongs_to :picture, required: false
end
