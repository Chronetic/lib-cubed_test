json.extract! movie, :id, :title, :description, :director, :writer, :user_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
