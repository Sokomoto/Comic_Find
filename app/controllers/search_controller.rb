class SearchController < ApplicationController

	def search
	    @comics = Comic.all.search(params[:search])
  end
end
