class AddSeasonsToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :seasons, :integer
  end
end
