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
  if @user
  	if signed_in?
  		respond_to do |format|
		 	 format.html
		  	format.json{
		  	  render :json => @user.to_json
		  	}
 	 	  end
 	 	 end
 	 else
 	 	render 'public/404.html'
	end
end
  
  def create
  	@user=User.new(params[:user])
  	if @user.save
  		 sign_in @user 
  		 flash[:success] = "Welcome to SocialCrow! Please verify your email address!"
  		 redirect_to "/@/#{params[:user][:username]}"
  	else
  		render 'new'
  	end
  end
  
  def edit
  	@user=User.find_by_id(params[:id])
  end
  
  def profile
  	@user=User.find_by_username(params[:username])
  end
end
