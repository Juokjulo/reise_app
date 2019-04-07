class StorytextPicture < ApplicationRecord
	belongs_to :storytext, inverse_of: :storytext_pictures, required: false
    belongs_to :picture

end
