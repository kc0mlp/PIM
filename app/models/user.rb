# 
#  user.rb
#  PIM
#  
#  Created by Kael Hankins on 2013-02-09.
#  Copyright 2013 Kael Hankins. All rights reserved.
#
#  Models the user for sorcery based authentication.
#  Uses the Sorcey gem from Noam Ben Ari
#  https://github.com/NoamB/sorcery

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :email, :password, :password_confirmation
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  
end
