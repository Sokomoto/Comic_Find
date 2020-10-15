class Admins::HomesController < ApplicationController

	def top
	    @comics = Comic.where(created_at: Time.zone.now.all_day)
	end

end
