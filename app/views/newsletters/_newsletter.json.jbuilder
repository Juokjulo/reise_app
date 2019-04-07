json.extract! newsletter, :id, :title, :letter, :created_at, :updated_at
json.url newsletter_url(newsletter, format: :json)