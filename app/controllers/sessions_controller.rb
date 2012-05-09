class SessionsController < ApplicationController
	def new
		
	end
	
	def create
		user=User.find_by_username(params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			redirect_to "/@/#{params[:session][:username]}"
		else
			flash[:error] = "Login failed! Please try again!"
			redirect_to "/login"
		end
	end
	
	def destroy
	
	end
end
