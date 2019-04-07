class Country < ApplicationRecord
	belongs_to :picture, inverse_of: :country
	has_many :pictures
	has_many :travel_tipps
	has_many :stories
	has_many :videos
	has_many :comments, as: :commentable
end
