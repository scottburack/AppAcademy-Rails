class AlbumsController < ApplicationController

  def new
    render :new
  end

  def create
    debugger
    @band = Band.find(params[:band_id])
    @album = Album.new(album_params)
    @album.band = @band
    if @album.save
      redirect_to band_url(@band)
      
    end
  end


  private

  def album_params
    params.require(:album).permit(:title, :year, :live_or_studio, :band_id)
  end

end
