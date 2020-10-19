class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!

	def top
	    @comics = Comic.where(created_at: Time.zone.now.all_day)
	end

end
