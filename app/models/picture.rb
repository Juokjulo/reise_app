class Picture < ApplicationRecord
	mount_uploader :image, PictureUploader 
	has_many :storytexts, through: :storytext_pictures

end
