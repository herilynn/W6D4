class ChangeArtworks < ActiveRecord::Migration[7.0]
  def change

    remove_column :artworks, :title 

    add_column :artworks, :title, :string, null: false

  end
end
