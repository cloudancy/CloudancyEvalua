class AddLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lastname, :string   

    #Seed the database with an admin user
    user = User.new
    user.name = 'admin'
    user.lastname = 'user'
    user.email = 'admin@admin.com'
    user.password = 'adf456'
    user.password_confirmation = 'adf456'    
    user.save
    user.add_role :admin
    user.save
  end
end
