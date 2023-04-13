class CreateArtworkShare < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.bigint :artwork_id, null: false 
      t.bigint :viewer_id 

      t.timestamps
    end

    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
    add_index :artwork_shares, :viewer_id

    add_foreign_key :artwork_shares, :users, column: :viewer_id
    add_foreign_key :artwork_shares, :artworks, column: :artwork_id


  end
end
