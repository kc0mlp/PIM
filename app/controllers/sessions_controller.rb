# 
#  sessions_controller.rb
#  PIM
#  
#  Created by Kael Hankins on 2013-02-09.
#  Copyright 2013 Kael Hankins. All rights reserved.
# 
#  Handel the logic for Sorcery sessions.

class SessionsController < ApplicationController
  def new
    #Nothing here since validation is now properly handled by the model.
  end
  
  end
  
  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Username or password was invalid"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
end
