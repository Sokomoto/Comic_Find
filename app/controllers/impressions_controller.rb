class ImpressionsController < ApplicationController

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
		@impression = ComicImpression.find(params[:id])
		@user = @impression.user
		@comic = Comic.find(params[:comic_id])
	end

	def edit
	end

	def destroy
		comic = Comic.find(params[:comic_id])
		impression = ComicImpression.find(params[:id])
		if impression.user != current_user
		   redirect_to comic_path(comic)
		end
			impression.destroy
			redirect_to comic_path(comic)
	end

	private

	def comic_impression_params
  	params.require(:comic_impression).permit(:impression)
  	end
end
