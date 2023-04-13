class Artworkshare < ApplicationRecord
  validates :artwork_id, presence: true

  belongs_to :viewer,
  foreign_key: :viewer_id,
  class_name: :User

  belongs_to :artwork,
  foreign_key: :artist_id,
  class_name: :Artwork

end