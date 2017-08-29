class TravelTipp < ApplicationRecord
	belongs_to :country, inverse_of: :travelTipps
	has_many :comments, as: :commentable
end
