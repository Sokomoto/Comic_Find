class Admins::ComicsController < ApplicationController

	def index
		@tag_list = Tag.all
    	@comics = Comic.all
	end

end
