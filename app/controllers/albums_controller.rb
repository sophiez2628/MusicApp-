class AlbumsController < ApplicationController
  before_action :logged_in? 
  def new
    @album = Album.new
    @bands = Band.all
    @current_band_id = params[:band_id]
    render :new
  end

  def create
    @bands = Band.all
    @album = Album.create(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
    #how to avoid hackers using the HTML file?
    #avoid it in the permit part of params
  end

  def show
    @album = Album.find_by(id: params[:id])
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id, :kind)
  end
end
