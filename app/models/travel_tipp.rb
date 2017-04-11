class TravelTipp < ApplicationRecord
	belongs_to :country, inverse_of: :travelTipps
end
