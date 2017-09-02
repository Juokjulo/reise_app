json.extract! news, :id, :text, :text_link, :link, :color, :created_at, :updated_at
json.url news_url(news, format: :json)
