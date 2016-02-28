class Customers::SessionsController < Devise::SessionsController
 # before_filter :configure_sign_in_params, only: [:create]
 #
 #
 #  def new
 #    super
 #  end
 #
 #  # POST /resource/sign_in
 def create
   p = params[:customer][:account]
   if p.present?
     y = params[:customer]["birthday(1i)"]
     m = params[:customer]["birthday(2i)"]
     d = params[:customer]["birthday(3i)"]
     if m.to_i < 10
       x = y + "-0" + m + "-0" + d
     else
       x = y + "-" + m + "-" + d
     end

     @c = Customer.find_by_account(p)
     z = @c.birthday.to_s
     #byebug
     if z == x
      super
     else
       redirect_to root_path
     end
   else
     redirect_to root_path
   end
 end
 #
 #  # DELETE /resource/sign_out
 #  def destroy
 #    super
 #  end
 #
 #  protected
 #
 #  #If you have extra params to permit, append them to the sanitizer.
 #  def configure_sign_in_params
 #    devise_parameter_sanitizer.for(:sign_in) << :attribute
 #  end
end
