class PimAdmin < ActiveRecord::Base
  attr_accessible :email, :first, :last, :password_digest, :username
  
  has_many :posts
end
