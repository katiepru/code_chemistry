module ApplicationHelper
  def logged_in?
    if session[:user_id] && User.find(session[:user_id])
      true
    else
      false 
    end
  end
end
