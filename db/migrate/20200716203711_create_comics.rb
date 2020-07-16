class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :artist
      t.integer :user_id

      t.timestamps
    end
  end
end
