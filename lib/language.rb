# 
#  language.rb
#  PIM
#  
#  Created by Kael Hankins on 2013-01-11.
#  Copyright 2013 Kael Hankins. All rights reserved.
# 
#  This file creates the initialization for the LANUGAGE module for providing easy string differentiation for multiple languages.

module LANGUAGE
  def self.lang
    @@lang ||= {}
  end
  
  def self.lang=(hash)
    @@lang = hash
  end
end