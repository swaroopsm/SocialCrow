class UsersController < ApplicationController
  def new
  	if signed_in?
  		redirect_to "/@/#{current_user.username}"
  	else	
  		@user=User.new
  	end
  end
  
  def show
  	@user=User.find_by_username(params[:username])
  end
  
  def create
  	@user=User.new(params[:user])
  	a=params[:username]
  	if @user.save
  		 flash[:success] = "Welcome to SocialCrow! Please verify your email address!"
  		 redirect_to "/@/#{params[:user][:username]}"
  	else
  		render 'new'
  	end
  end
end
