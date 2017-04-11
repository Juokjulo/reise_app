class Story < ApplicationRecord
	belongs_to :country, inverse_of: :stories
	belongs_to :picture, inverse_of: :stories
	belongs_to :user
	has_many :storytexts, dependent: :destroy, inverse_of: :story
	accepts_nested_attributes_for :storytexts, reject_if: proc { |attributes| attributes['storypart'].blank? and attributes['title'].blank?}, allow_destroy: true
end
