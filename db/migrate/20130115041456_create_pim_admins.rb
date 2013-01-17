class CreatePimAdmins < ActiveRecord::Migration
  def change
    create_table :pim_admins do |t|
      t.string :first
      t.string :last
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
