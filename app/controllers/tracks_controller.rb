class TracksController < ApplicationController
  def new
    @current_album_id = params[:album_id]
    @track = Track.new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.create(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  private
  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics, :kind)
  end

end
