class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :image_url, unique: true
      t.bigint :artist_id, null: false
      t.timestamps
    end
    add_index :artworks, :artist_id
    add_index :artworks, [:title, :artist_id], unique: true

    add_foreign_key :artworks, :users, column: :artist_id
  end
end
