class FavoriteSpotsController < ApplicationController
  def index
    @favorite_spots = FavoriteSpot.all
    @hash = Gmaps4rails.build_markers(@favorite_spots) do |favorite_spot, marker|
      marker.lat favorite_spot.latitude
      marker.lng favorite_spot.longitude
    end
  end

  def new
    @favorite_spot = FavoriteSpot.new
  end

  def create
    @favorite_spot = FavoriteSpot.new(favorite_spot_params)
    @favorite_spot.user = current_user

    if @favorite_spot.save
      flash[:notice] = "Your Favorite spot has been added to your map!"
      redirect_to favorite_spots_path
    else
      flash.now[:alert] = @favorite_spot.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def favorite_spot_params
    params.require(:favorite_spot).permit(
      :user_id,
      :location_name,
      :latitude,
      :longitude,
      :address
    )
  end
end
