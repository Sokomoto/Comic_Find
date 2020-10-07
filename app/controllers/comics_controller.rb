class ComicsController < ApplicationController
	before_action :correct_user, only: [:edit,:update]

	def new
		@comic = Comic.new
	end

	def create
		@comic = Comic.new(comic_params)
		@comic.user_id = current_user.id
		@comic.save
		redirect_to comics_path
	end

	def index
    	@comics = Comic.all
    	@all_ranks = Comic.find(Favorite.group(:comic_id).order('count(comic_id) desc').limit(5).pluck(:comic_id))
	end

	def show
		@comic = Comic.find(params[:id])
		@impressions = Impression.where(comic_id: @comic.id)
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def comic_params
  	params.require(:comic).permit(:image, :title, :explanation)
  	end

  	def correct_user
    @comic = current_user.comics.find_by(id: params[:id])
      unless @comic
      redirect_to comics_path
      end
  	end
end
