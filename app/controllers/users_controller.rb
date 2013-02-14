# 
#  users_controller.rb
#  PIM
#  
#  Created by Kael Hankins on 2013-02-09.
#  Copyright 2013 Kael Hankins. All rights reserved.
# 
#  Handels the user logic for Sorcey and user profiles.

class UsersController < ApplicationController
  #Return all the users currently registered.
  def index
    @users = User.all
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @users }
    end
  end
  
  #Return a single user found by their id
  def show
    @user = User.find(:params['id'])
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
    end
  end
  
  #Create an empty new user.
  def new
    @user = User.new
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
    end
  end
  
  #Get a user for editing
  def edit
    @user = User.find(:params['id'])
  end
  
  #Create a new user and populate with data from parameters.
  def create
    @user = User.new(params[:user]) #Try to add the user
    
    respond_to do |format|
      if @user.save #On success
        format.html { redirect_to(:users, :notice => LANGUAGE.lang['user_registration_success_notice']) }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  #Update an existing user
  def update
    @user = User.find(:params['id'])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => LANGUAGE.lang['user_edit_success_notice']) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  #Delete a user
  def destroy
    @user = User.find(:params['id'])
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml {head :ok }
    end
  end
  
  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      redirect_to(login_path, :notice => LANGUAGE.lang['user_activation_success_notice'])
    else
      not_authenticated
    end
  end
  
  
end