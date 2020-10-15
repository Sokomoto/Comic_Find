class Admins::SearchController < ApplicationController

	def search
	    if !User.search(params[:search]).blank?
	      # ユーザーーで検索がヒットした場合
	      @users = User.search(params[:search])
	    elsif !Comic.search(params[:search]).blank?
	      # マンガで検索がヒットした場合
	      @comics = Comic.search(params[:search])
	    end
  	end
end
