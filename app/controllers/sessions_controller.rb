class SessionsController < ApplicationController
	def new
		
	end
	
	def create
		user=User.find_by_username(params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			redirect_to "/@/#{params[:session][:username]}"
		else
			flash.now[:error] = "Login failed! Please try again!"
			render 'new'
		end
	end
	
	def destroy
	
	end
end
