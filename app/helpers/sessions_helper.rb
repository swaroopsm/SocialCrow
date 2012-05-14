module SessionsHelper

	def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end

	def signed_in?
    !current_user.nil?
  end
  
  def sign_out
  	current_user=nil
  	cookies.delete(:remember_token)
  end

	def store_location
		session[:return_to] = request.fullpath
	end
	
	def redirect_back_to
		if session[:return_to]==nil
			redirect_to "/@/#{current_user.username}"
		else
			redirect_to session[:return_to]
		end
	end
	
	def current_user?(user)
		@current_user=user
	end
	
  private

    def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token) unless remember_token.nil?
    end   
end
