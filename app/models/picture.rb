class Picture < ApplicationRecord
	acts_as_taggable 
	mount_uploader :image, PictureUploader 
	has_many :storytexts, through: :storytext_pictures
	has_many :storytext_pictures, dependent: :destroy
	has_one :material
	belongs_to :country
	has_many :stories
	has_many :travel_tipps_segments
	has_many :comments, as: :commentable
end
