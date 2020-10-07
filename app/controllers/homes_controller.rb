class HomesController < ApplicationController
	def top
    	@all_ranks = Comic.find(Favorite.group(:comic_id).order('count(comic_id) desc').limit(5).pluck(:comic_id))
	end
end
