class Post < ActiveRecord::Base
  attr_accessible :content, :title
  
  belongs_to :pimAdmin
end
