if current_user.try(:admin?)
	json.array! @pictures, partial: 'pictures/picture', as: :picture
end