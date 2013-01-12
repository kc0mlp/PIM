class ApplicationController < ActionController::Base
  protect_from_forgery
  
  around_filter :set_time_zone
  
  def set_time_zone
    old_time_zone = Time.zone
    Time.zone = APP_CONFIG.config['timezone']  #Needs adjusted for login eventually.
    #Something like:  Time.zone = current_user.time_zone if logged_in?
    yield
  ensure
    Time.zone = old_time_zone
  end
end
