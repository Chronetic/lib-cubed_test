class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :director
      t.string :writer
      t.integer :user_id

      t.timestamps
    end
  end
end
