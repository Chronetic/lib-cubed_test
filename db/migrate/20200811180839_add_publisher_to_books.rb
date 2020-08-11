class AddPublisherToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :publisher, :sting
  end
end
