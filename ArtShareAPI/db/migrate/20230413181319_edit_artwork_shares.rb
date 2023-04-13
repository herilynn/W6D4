class EditArtworkShares < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :artwork_shares, column: :artwork_id
    add_foreign_key :artwork_shares, :artworks, column: :artwork_id
  end
end
