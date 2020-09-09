class ImpressionsController < ApplicationController
	before_action :get_comic
	before_action :get_impression, only:[:show, :edit, :update, :destroy]

	def new
		@impression = ComicImpression.new
	end

	def create
		@impression = ComicImpression.new(comic_impression_params)
		@impression.user_id = current_user.id
		@impression.comic_id = params[:comic_id]
		@impression.save
		redirect_to comic_impression_path(params[:comic_id], @impression.id)
	end

	def show
		@user = @impression.user
	end

	def edit
	end

	def update
		@impression.update(comic_impression_params)
		redirect_to comic_impression_path(params[:comic_id], @impression.id)
	end

	def destroy
		if @impression.user != current_user
		   redirect_to comic_path(@comic)
		end
			@impression.destroy
			redirect_to comic_path(@comic)
	end

	private

	def get_comic
		@comic = Comic.find(params[:comic_id])
	end

	def get_impression
		@impression = ComicImpression.find(params[:id])
	end


	def comic_impression_params
  	params.require(:comic_impression).permit(:impression)
  	end
end
