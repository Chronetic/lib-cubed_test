class AddEpisoderuntimeToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :episoderuntime, :integer
  end
end
