class Storytext < ApplicationRecord
	belongs_to :story, inverse_of: :storytexts
	has_many :pictures, through: :storytext_pictures 
	has_many :storytext_pictures
	validates_presence_of :story
	accepts_nested_attributes_for :storytext_pictures, allow_destroy: true
end
