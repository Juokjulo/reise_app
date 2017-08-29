class Video < ApplicationRecord
	acts_as_taggable 
	belongs_to :country, inverse_of: :videos
	has_many :comments, as: :commentable
end
