class ComicsController < ApplicationController
	#before_action :correct_user, only: [:edit,:update]

	def new
		@comic = Comic.new
	end

	def create
		@comic = Comic.new(comic_params)
		@comic.user_id = current_user.id
		tag_list = params[:comic][:tag_name].split(',')
		@comic.save
		@comic.save_tags(tag_list)
		redirect_to comics_path
	end

	def index
		@tag_list = Tag.all
    	@comics = Comic.all
    	@all_ranks = Comic.find(Favorite.group(:comic_id).order('count(comic_id) desc').limit(5).pluck(:comic_id))
	end

	def show
		@comic = Comic.find(params[:id])
		@impressions = Impression.where(comic_id: @comic.id)
		@comic_tags = @comic.tags
	end

	def edit
		@comic = Comic.find(params[:id])
		@tag_list = @comic.tags.pluck(:tag_name).join(',')
	end

	def update
		@comic = Comic.find(params[:id])
		tag_list = params[:comic][:tag_name].split(',')
    	@comic.update(comic_params)
    	@comic.save_tags(tag_list)
      	redirect_to comic_path(@comic.id)
	end

	def search
		@tag_list = Tag.all
		@tag = Tag.find(params[:tag_id])
		@comics = @tag.comics.all
	end

	def word_search
		@comics = Comic.search(params[:search])
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
