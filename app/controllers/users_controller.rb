class UsersController < ApplicationController
  # Protect these actions behind an admin login
  # before_filter :admin_required, :only => [:suspend, :unsuspend, :destroy, :purge]
  before_filter :find_user, :only => [:suspend, :unsuspend, :destroy, :purge]
  
  def show
    @user = User.find(params[:id])
  end

  def create
    cookies.delete :auth_token

    @user = User.new(params[:user])
    @user.register! if @user.valid?
    if @user.errors.empty?
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if current_user && ! current_user.active?
      current_user.activate!
      flash[:notice] = "Signup complete!"
    else 
      flash[:alert] =  "Invalid activation key"
    end
    redirect_back_or_default('/')
  end
  
  def change_password
    return unless request.post?
    if User.authenticate(current_user.login, params[:old_password])
      if params[:password] == params[:password_confirmation]
        current_user.password_confirmation = params[:password_confirmation]
        current_user.password = params[:password]

        if current_user.save
          flash[:notice] = "Password successfully updated" 
          redirect_to profile_url(current_user.login)
        else
          flash[:alert] = "Password not changed" 
        end
      else
        flash[:alert] = "New password mismatch" 
        @old_password = params[:old_password]
      end
    else
      flash[:alert] = "Old password incorrect" 
    end
  end

  def forgot_password
    return unless request.post?
    if @user = User.find_by_email(params[:user][:email])
      @user.forgot_password
      @user.save
      redirect_back_or_default('/')
      flash[:notice] = "A password reset link has been sent to your email address" 
    else
      flash[:alert] = "Could not find a user with that email address" 
    end
  end

  def reset_password
      @user = User.find_by_password_reset_code(params[:id])
      return if @user unless params[:user]

      if ((params[:user][:password] && params[:user][:password_confirmation]) && ! params[:user][:password_confirmation].blank?)
      @user.password_confirmation = params[:user][:password_confirmation]
      @user.password = params[:user][:password]
      @user.reset_password
      flash[:notice] = @user.save ? "Password reset success." : "Password reset failed." 
      redirect_back_or_default('/')
    else
      flash[:alert] = "Password mismatch" 
    end  
  end

  def suspend
    @user.suspend! 
    redirect_to users_path
  end

  def unsuspend
    @user.unsuspend! 
    redirect_to users_path
  end

  def destroy
    @user.delete!
    redirect_to users_path
  end

  def purge
    @user.destroy
    redirect_to users_path
  end

protected

  def find_user
    @user = User.find(params[:id])
  end

end