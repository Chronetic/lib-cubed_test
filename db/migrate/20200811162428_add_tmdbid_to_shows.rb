class AddTmdbidToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :tmdbid, :integer
  end
end
