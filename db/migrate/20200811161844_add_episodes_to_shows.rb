class AddEpisodesToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :episodes, :integer
  end
end
