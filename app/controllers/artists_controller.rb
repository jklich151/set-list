class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    if artist.save
      redirect_to '/artists'
    else
      flash[:notice] = "Artist not created: Required info missing"
      render :new
    end
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to '/artists'
  end

  def edit
    @artist_id = params[:id]
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to '/artists'
  end

  private

    def artist_params
      params.require(:artist).permit(:name)
    end
end
