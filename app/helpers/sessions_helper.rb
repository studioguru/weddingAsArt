module SessionsHelper
	def sign_in(user)
    puts user.id
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

  def sign_out
  	self.current_user = nil
  	cookies.delete(:remember_token)
  end

  def store_location
  	session[:return_to] = request.url
  end
end
