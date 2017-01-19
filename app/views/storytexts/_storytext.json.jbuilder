json.extract! storytext, :id, :title, :storypart, :created_at, :updated_at
json.url storytext_url(storytext, format: :json)