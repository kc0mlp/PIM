# 
#  authentication_mailer.rb
#  PIM
#  
#  Created by Kael Hankins on 2013-02-10.
#  Copyright 2013 Kael Hankins. All rights reserved.
# 
#  This class handeles the mailer logic for authentication.

class AuthenticationMailer < ActionMailer::Base
  default :from => APP_CONFIG.config['authentication_email_address']

  def activation_email(user)
    @user = user
    @url = "http://#{APP_CONFIG.config['base_url']}/users/#{user.activation_token}/activate"
    mail(:to => user.email, :subject => APP_CONFIG.config['activation_email_subject'])
  end
  
  def activation_success_email(user)
    @user = user
    @url  = "http://#{APP_CONFIG.config['base_url']}/login"
    mail(:to => user.email, :subject => APP_CONFIG.config['activation_success_email_subject'])
  end
  
  def reset_password_email(user)
    @user = user
    @url  = "http://#{APP_CONFIG.config['base_url']}/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email, :subject => APP_CONFIG.config['password_reset_email_subject'])
  end
end
