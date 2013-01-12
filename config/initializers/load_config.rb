# 
#  load_config.rb
#  PIM
#  
#  Created by Kael Hankins on 2013-01-10.
#  Copyright 2013 Kael Hankins. All rights reserved.
#
# This section is inspired by Ryan Bates's Rails Cast #85 : YAML Configuration File. Check it out here: http://railscasts.com/episodes/85-yaml-configuration-file
# This file lists all the configuration files to load and the environment sections therein to load.
# Load order for the YAML files is important for some reason not yet understood by me.

require 'app_config'  # /lib/app_config.rb
require 'language' # /lib/language.rb

# Initialize the LANGUAGE module as with the APP_CONFIG module.
LANGUAGE.lang = YAML.load_file("#{Rails.root}/config/languages/english.yml")

# Initialize the APP_CONFIG module with the YAML from the config file both default and appropriate environment sections.
APP_CONFIG.config = YAML.load_file("#{Rails.root}/config/configs/config.yml")[Rails.env]