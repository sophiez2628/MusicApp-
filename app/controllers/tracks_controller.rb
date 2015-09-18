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

  def edit
    @track = Track.find_by(id: params[:id])
    @albums = Album.all
    @current_album_id = @track.album_id
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update(track_params)
      render :show
    else
      render :edit
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    @track_album = Album.find_by(id: @track.album_id).name
    render :show
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    @track.destroy
    render :new
  end 

  private
  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics, :kind)
  end

end
