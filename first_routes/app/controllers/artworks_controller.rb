class ArtworksController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    user = User.find(params[:user_id])
    collection = user.artworks + user.viewed_artworks
    render json: collection
  end
  
  def create
    # render json: params
    artwork = Artwork.new(artwork_params)
    
    if artwork.save
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: :unprocessable_entity, error: 422
    end
  end
  
  def show
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      render json: artwork
    else
      render json: ['Artwork not found'], status: :unprocessable_entity, error: 422
    end
  end
  
  def update
    artwork = Artwork.find(params[:id])
    
    if artwork.update(artwork_params)
      render json: artwork 
    else 
      render json: artwork.errors.full_messages, status: 422
    end
  end
  
  def destroy
    artwork = Artwork.find_by(id: params[:id])
    
    if artwork 
      artwork.destroy
      render json: ["Artwork has been deleted"]
    else 
      render json: ['Artwork not found'], status: :unprocessable_entity, error: 422
    end  
    
  end
  
  private 
  
  def artwork_params
    params[:artwork].permit(:title, :img_url, :artist_id)
  end
  
    
end

