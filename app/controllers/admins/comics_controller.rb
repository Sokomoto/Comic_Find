class Admins::ComicsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@tag_list = Tag.all
    	@comics = Comic.all
	end

	def show
		@comic = Comic.find(params[:id])
		@impressions = Impression.page(params[:page]).reverse_order.where(comic_id: @comic.id)
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
      	redirect_to admins_comic_path(@comic)
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
		@comic = Comic.find(params[:id])
    	if @comic.destroy
      	redirect_to admins_comics_path
    	end
	end

	private

	def comic_params
  		params.require(:comic).permit(:image, :title, :author, :explanation)
  	end

end
