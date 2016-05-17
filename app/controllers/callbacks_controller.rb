class CallbacksController <  ApplicationController
 
 def facebook
auth = request.env['omniauth.auth']
unless @auth = User.find_from_hash(auth)
@auth = User.find_or_create(auth)
end
unless @auth.confirmed?
@auth.confirm!
end
@user = @auth
session[:fb_token] = auth['credentials']['token'] if @auth['provider'] == 'facebook'
if @user.persisted?
flash[:success] = "Signed in successfully."
sign_in(@user)
redirect_to after_sign_in_path_for(@user)
else
flash[:error] = "Login failed."
redirect_to root_path
end
end

end
