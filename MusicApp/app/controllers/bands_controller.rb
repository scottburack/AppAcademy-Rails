class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    @album = Album.find(params[:band_id])
    @band.album = @album
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to session_url
  end


  private

  def band_params
    params.require(:band).permit(:name)
  end



end
