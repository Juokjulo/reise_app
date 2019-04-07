if current_user.try(:admin?)
 json.partial! "pictures/picture", picture: @picture
end