json.extract! video, :id, :public, :name, :description, :url, :created_at, :updated_at
json.url video_url(video, format: :json)