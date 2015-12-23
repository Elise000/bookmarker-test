class SessionsController < ApplicationController

	def new
	end


	def create
  	user = User.find_by(email: login_params[:email])
 		
		if user
			@user = user.authenticate(login_params[:password])
			if @user
				session[:user_id] = @user.id
	
				flash[:success] = "Welcome, #{@user.email}"
  			redirect_to bookmarks_path #user_path(@user)
  		else
    		flash[:error] = "wrong password"
  			render 'new'
  		end
  	end
  	# 	flash[:error] = "wrong password"
  	# 	render 'new'
  	# end

  end

    private

    def login_params
      params.require(:session).permit(:email, :password)
    end

end

	# def create
 #  	user = User.find_by(email: params[:session][:email])
 		
	# 	if user
	# 		@user = user.authenticate(params[:session][:password])
	# 		if @user
	# 			session[:user_id] = @user.id
 #  			redirect_to bookmarks_path and return#user_path(@user)
 #  		end
 #  	end
	# 	flash[:error] = "wrong password"
	# 	render 'new'
 #  end
