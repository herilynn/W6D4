# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  image_url  :string
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           not null
#
class Artwork < ApplicationRecord
    validates :title, :artist_id, :image_url, presence: true
    validates :image_url, uniqueness: true

    belongs_to :artist, 
        foreign_key: :artist_id, 
        class_name: :User 

    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_viewers,
        through: :shares,
        source: :viewer

end
