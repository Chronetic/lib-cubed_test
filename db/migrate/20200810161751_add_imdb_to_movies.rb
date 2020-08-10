class AddImdbToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :imdb, :string
  end
end
