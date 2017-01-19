class Story < ApplicationRecord
	has_many :storytexts, dependent: :destroy

end
