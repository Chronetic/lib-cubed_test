class AddReleaseToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :release_date, :string
  end
end
