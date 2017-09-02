json.extract! route, :id, :title, :maplink, :description, :garminlink, :created_at, :updated_at
json.url route_url(route, format: :json)
