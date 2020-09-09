class ImpressionsController < ApplicationController
	before_action :get_comic
	before_action :get_impression, only:[:show, :edit, :update, :destroy]

	def new
		@impression = Impression.new
	end

	def create
		@impression = Impression.new(impression_params)
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
		@impression.update(impression_params)
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
		@impression = Impression.find(params[:id])
	end


	def impression_params
  		params.require(:impression).permit(:impression)
  	end
end
