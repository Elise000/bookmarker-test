class ApplicationController < ActionController::Base

	def login(user)
    session[:user_id] = user.id
  end

	def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def user_logged_in?
    !current_user.nil?
  end

  private

  	def authenticate_user!
  		unless user_logged_in?
        flash[:notice] = "Please log in or sign up first"
        redirect_to new_session_path 
  		end
  	end
  
end
