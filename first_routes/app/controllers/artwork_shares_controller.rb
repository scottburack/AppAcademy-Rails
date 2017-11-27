class ArtworkSharesController < ApplicationController
  
  def create
    artworkshare = ArtworkShare.new(artworkshare_params)
    
    if artworkshare.save
      render json: artworkshare
    else 
      render json: artworkshare.errors.full_messages, status: :unprocessable_entity, error: 422
    end
  end
  
  def destroy
    artworkshare = ArtworkShare.find_by(id: params[:id])
    
    if artworkshare 
      artworkshare.destroy
      render json: ["ArtworkShare has been deleted"]
    else 
      render json: ['ArtworkShare not found'], status: :unprocessable_entity, error: 422
    end  
  end
  
  private 
  
  def artworkshare_params 
    params[:artworkshare].permit(:artwork_id, :viewer_id)
  end
end
