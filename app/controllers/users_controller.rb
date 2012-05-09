class UsersController < ApplicationController
  def new
  	@user=User.new
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
