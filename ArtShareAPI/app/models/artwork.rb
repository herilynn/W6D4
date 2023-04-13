class Artwork < ApplicationRecord
    validates :title, :artist_id, :image_url, presence: true
    validates :image_url, uniqueness: true

    belongs_to :artist, 
        foreign_key: :artist_id, 
        class_name: :User 
    

end