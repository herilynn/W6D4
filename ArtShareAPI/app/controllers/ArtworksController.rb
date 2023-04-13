class ArtworksController < ApplicationController

    def index 
        @artworks = Artwork.all 
        render json: @artworks 
    end

    def create 
        artwork = Artwork.new(artwork_params)

        if artwork.save!
            render json: artwork 
        else
            render json: artwork.error.full_message, status: :unprocessable_entity
        end

    end

    def show 
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update 
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: artwork.error.full_message, status: :unprocessable_entity
        end

    end

    def destroy 
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to artworks_url

    end

    private

    def artwork_params
        params.require(:artwork).permit(:image_url, :artist_id, :title)
    end

end