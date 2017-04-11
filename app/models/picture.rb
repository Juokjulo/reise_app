class Picture < ApplicationRecord
	mount_uploader :image, PictureUploader 
	has_many :storytexts, through: :storytext_pictures
	has_many :storytext_pictures, dependent: :destroy
	has_one :material
	belongs_to :country
	has_many :stories
end
