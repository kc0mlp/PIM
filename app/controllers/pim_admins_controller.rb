# 
#  pim_admins_controller.rb
#  PIM
#  
#  Created by Kael Hankins on 2013-01-17.
#  Copyright 2013 Kael Hankins. All rights reserved.
# 
#  Controller for the pimAdmins and administrator user system. 

class PimAdminsController < ApplicationController
  
  #layout 'pim_admins' Add this later
  
  respond_to :html, :xml, :json
  
  def index
    @pim_admins = PimAdmin.all
    
    respond_with(@pim_admins)
  end

  def show
    @pim_admin = PimAdmin.find(params[:id])
    
    respond_with(@pim_admin)
  end

  def new
    @pim_admin = PimAdmin.new
    
    respond_with(@pim_admin)
  end

  def edit
    @pim_admin = PimAdmin.find(params[:id])
    
    respond_with(@pim_admin)
  end

  def create
    @pim_admin = PimAdmin.new(params[:post])
    
    if @pim_admin.save
      flash[:notice] = LANGUAGE.lang['new-pim-admin-success']
    end
    
    respond_with(@pim_admin)
  end
  
  def update
    @pim_admin = PimAdmin.find(params[:post])
    
    if @pim_admin.update_attributes(params[:post])
      flash[:notice] = LANGUAGE.lang['edit-pim-admin-success']
    end
    respond_with(@pim_admin)
  end

  def destroy
    @pim_admin = PimAdmin.find(params[:id])
    @pim_admin.destroy
    
    if @pim_admin == nil
      flash[:notice] = LANGUAGE.lang['destroy-pim-admin-success']
    end
      
    respond_with(@pim_admin)
  end
end
