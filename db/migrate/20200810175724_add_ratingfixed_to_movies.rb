class AddRatingfixedToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :movierating, :float
  end
end
