class ComicsController < ApplicationController

	def create
	end

	def index
    	@comics = Comic.all
	end

	def new
		@comic = Comic.new
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def comic_params
  	params.require(:comic).permit(:title, :explanation)
  end
end
