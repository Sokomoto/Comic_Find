class Admins::ComicsController < ApplicationController

	def index
		@tag_list = Tag.all
    	@comics = Comic.all
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
      	redirect_to admins_comic_path(@comic.id)
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

end
