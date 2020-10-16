class HomesController < ApplicationController
	def top
    	@all_ranks = Comic.find(Favorite.group(:comic_id).order('count(comic_id) desc').limit(10).pluck(:comic_id))
    	@impressions = Impression.order(created_at: :desc).limit(10)
	end
end
