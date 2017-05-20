class Video < ApplicationRecord
	acts_as_taggable 
	belongs_to :country, inverse_of: :videos
end
