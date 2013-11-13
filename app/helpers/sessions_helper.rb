module SessionsHelper
	def sign_in(user)
		cookies.permanent[:remember_token] = user._id
    @current_user = user
  end

  def signed_in?
  	@current_user != nil
  end

  def current_user
    @current_user ||= Photographer.find(cookies[:remember_token])
  end

  def current_user?(user)
    @current_user == user
  end

  def current_user_is?(type)
    @current_user && @current_user.class.to_s == type
  end

  def sign_out_current_user
  	@current_user = nil
  	cookies.delete(:remember_token)
  end

  def store_location
  	session[:return_to] = request.url
  end
end
