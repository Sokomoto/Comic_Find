class Admins::ImpressionsController < ApplicationController
	before_action :get_comic
	before_action :get_impression, only:[:show, :edit, :update, :destroy]

	def show
		@user = @impression.user
	end

	def edit
	end

	def update
		@impression.update(impression_params)
		redirect_to admins_comic_impression_path(params[:comic_id], @impression.id)
	end

	def destroy
		if @impression.user != current_user
		   redirect_to admins_comic_path(@comic)
		end
			@impression.destroy
			redirect_to admins_comic_path(@comic)
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
