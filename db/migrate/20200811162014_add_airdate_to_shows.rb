class AddAirdateToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :airdate, :string
  end
end
