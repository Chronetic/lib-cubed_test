json.extract! comic, :id, :title, :description, :author, :artist, :user_id, :created_at, :updated_at
json.url comic_url(comic, format: :json)
