class UsersController < ApplicationController
  def new
  end
  
  def show
  	@user=User.find_by_username(params[:username])
  end
end
