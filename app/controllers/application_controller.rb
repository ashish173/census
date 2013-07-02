class ApplicationController < ActionController::Base
  # used to put common code that is common in all the controllers
  # like the check for checking if a user is logged in
  # before_filter user_logged_in? is an example
  protect_from_forgery
  
  def after_sign_out_path_for(resource_of_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_of_scope)
    surveys_path
  end

  

end
