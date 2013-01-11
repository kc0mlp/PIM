# 
#  app_config.rb
#  PIM
#  
#  Created by Kael Hankins on 2013-01-11.
#  Copyright 2013 Kael Hankins. All rights reserved.
# 
#  This file creates the APP_CONFIG module for providing configuration variables
module APP_CONFIG
  def self.config
    @@config ||= {}
  end
  
  def self.config=(hash)
    @@config = hash
  end
end