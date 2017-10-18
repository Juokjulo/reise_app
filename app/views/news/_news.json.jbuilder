json.extract! news, :id, :text, :created_at, :updated_at
json.url news_url(news, format: :json)
