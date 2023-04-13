# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Base.transaction do
    puts "Preparing #{Rails.env} environment"
  
    puts 'Destroying tables...'
    ArtworkShare.delete_all
    Artwork.delete_all
    User.delete_all
  
    puts 'Resetting id sequences...'
    %w(users artworks artwork_shares).each do |table_name|
      ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end
  
    puts 'Creating seed data...'
    gerald = User.create!(
      username: "cousin_gerald"
    )
  
    gillian = User.create!(
      username: "gillian"
    )
  
    banana = Artwork.create!(
        image_url: 'banana.com',
        artist_id: gerald.id, 
        title: 'banana'
    )

    cookie = Artwork.create!(
        image_url: 'cookie.com',
        artist_id: gillian.id, 
        title: 'cookie'
    )
  
    share1 = ArtworkShare.create!(artwork_id: banana.id, viewer_id: gillian.id)
    share2 = ArtworkShare.create!(artwork_id: cookie.id, viewer_id: gerald.id)
    
    puts "Done with #{Rails.env} environment!"
  end