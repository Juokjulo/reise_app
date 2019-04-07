class TravelTippsSegment < ApplicationRecord
	belongs_to :travel_tipp, inverse_of: :travel_tipps_segments, required: false
	belongs_to :picture, inverse_of: :travel_tipps_segments
	validates_presence_of :travel_tipp
end
