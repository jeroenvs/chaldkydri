class UserObserver < ActiveRecord::Observer

  def before_save(user)
    UserMailer.deliver_signup_notification(user) unless user.active?    
  end

  def after_save(user)
    
    UserMailer.deliver_activation(user) if user.recently_activated?
  end
end
