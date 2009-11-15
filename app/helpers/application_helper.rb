# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def user_logged_in?
   current_user
  end
end
