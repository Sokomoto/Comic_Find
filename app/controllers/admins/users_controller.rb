class Admins::UsersController < ApplicationController
	before_action :correct_user

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

	private

	def user_params
    	params.require(:user).permit(:name, :profile_image, :email)
  	end

  	def correct_user
	    @user = User.find(params[:id])
	    unless current_user.id == @user.id
	      redirect_to user_path(current_user)
	    end
  	end
end
