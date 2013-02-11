# 
#  users_controller.rb
#  PIM
#  
#  Created by Kael Hankins on 2013-02-09.
#  Copyright 2013 Kael Hankins. All rights reserved.
# 
#  Handels the user logic for Sorcey and user profiles.

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end
  
  def activate
    #finish
  end
  
  
end