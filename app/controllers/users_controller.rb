class UsersController < ApplicationController
	before_action :correct_user

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
    		redirect_to user_path(@user)
    	else
      		render :edit
    	end
  	end

	def leave
	end

	def hide
		if @user.update(is_status: "退会済")
			sign_out current_user
			redirect_to root_path, notice: "退会処理が完了しました。ご利用ありがとうございました。"
    	else
      		render :edit
    	end
	end

	def postindex
		@comics = @user.comics
	end

	def postimpression
  		@impressions = @user.impressions
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
