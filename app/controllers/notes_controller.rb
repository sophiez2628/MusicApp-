class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.track_id = params[:track][:id]
    @note.save
    redirect_to track_url(@note.track_id)
  end

  private
  def note_params
    params.require(:note).permit(:note_body)
  end
end
