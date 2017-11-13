class TravelTipp < ApplicationRecord
	belongs_to :country, inverse_of: :travel_tipps
	belongs_to :travel_tipps_category, inverse_of: :travel_tipps
	has_many :comments, as: :commentable
	has_many :travel_tipps_segments, dependent: :destroy, inverse_of: :travel_tipp
	accepts_nested_attributes_for :travel_tipps_segments, allow_destroy: true
end
