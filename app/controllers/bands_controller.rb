class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    @band = Band.find_by(id: params[:id])
    @band.update(band_params)
    redirect_to band_url(@band)
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    @band.destroy
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.create(band_params)
    render :show
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

end
