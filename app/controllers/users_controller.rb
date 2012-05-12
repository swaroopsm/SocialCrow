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
  	if signed_in?
	  	@user=User.find_by_username(params[:username])
	  else
	  	flash[:notice] = "Please login with your SocialCrow account in order to view the requested page"
	  	redirect_to '/login'
	  end
  end
  
  def profile
  	@user=User.find_by_username(params[:username])
  end
  
  def update
  	@user=User.find_by_username(params[:username])
  	if @user.update_attributes(params[:user])
  		sign_in @user
  		flash[:success]="Your information has been updated!"
  		redirect_to '/'
  	else
  		render 'edit'
  	end
  end
end
