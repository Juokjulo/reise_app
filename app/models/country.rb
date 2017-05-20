class Country < ApplicationRecord
	belongs_to :picture, inverse_of: :country
	has_many :pictures
	has_many :travelTipps
	has_many :stories
	has_many :videos
end
