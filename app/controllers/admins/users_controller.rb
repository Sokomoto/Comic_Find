class Admins::UsersController < ApplicationController
	before_action :find_user,only: [:show,:edit,:update,:postindex,:postimpression]

	def index
		@users = User.all
	end

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
    		redirect_to admins_user_path(@user)
    	else
      		render :edit
    	end
  	end

  	def postindex
  		@comics = @user.comic
  	end

  	def postimpression
  		@comic = @user.comic
  		@impressions = @user.impression
  	end

	private

	def user_params
    	params.require(:user).permit(:name, :profile_image, :email)
  	end

  def find_user
    @user = User.find(params[:id])
  end
end
