class FavoritesController < ApplicationController

	def create
		comic = Comic.find(params[:comic_id])
	    favorite = current_user.favorites.create(comic_id: comic.id)
	    favorite.save
	    redirect_to comic_path(comic)
	end

	def destroy
		comic = Comic.find(params[:comic_id])
	    favorite = current_user.favorites.find_by(comic_id: comic.id)
	    favorite.destroy
	    redirect_to comic_path(comic)
	end

end
