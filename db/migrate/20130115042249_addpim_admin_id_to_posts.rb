class AddpimAdminIdToPosts < ActiveRecord::Migration
  class Post < ActiveRecord::Base
  end
  
  def change
    add_column :posts, :pimAdmin_id, :integer
  end
end
