class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
      flash[:notice] = "You have succesfully signed up."
      login(@user)
      redirect_to root_path
    else
      render :new
    end
	end

	def user_params
    params.require(:user).permit(:email, :password)
  end

end
