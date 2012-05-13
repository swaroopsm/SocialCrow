class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :find_username, only: [:edit,:update,:show,:profile]
	
  def new
  	if signed_in?
  		redirect_to "/@/#{current_user.username}"
  	else	
  		@user=User.new
  	end
  end
  
  def show
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
  end
  
  def profile
  	
  end
  
  def update
  	if @user.update_attributes(params[:user])
  		sign_in @user
  		flash[:success] = "Profile settings updated!"
  		redirect_to "/@/#{current_user.username}"
  	else
  		render 'edit'
  	end
  end
  
  private

    def signed_in_user
      redirect_to "/login", notice: "Please login with your SocialCrow account in order to view the requested page" unless signed_in?
    end
    
    def find_username
    	@user=User.find_by_username(params[:username])
    end
end
