class AlterUsers < ActiveRecord::Migration
  def self.up
    #rename_table("users", "admin_users")
    #add_column("admin_users", "username", :string, :limit=> 25)
    #change_column("admin_users", "email", :string, :limit=> 100)
    #rename_column("admin_users","password","hashed_password")
    #add_column("admin_users","salt", :string, :limit=>40)
    #add_index("admin_users", "username")
  end

  def self.down
    #remove_index("admin_users", "username")
    #remove_column("admin_users","salt")
    #rename_column("admin_users", "hashed_password", "password")
    #change_column("admin_users","email", :string, :default=>"", :null=>false)
    #remove_column("admin_user", "username")
    #rename_table("admin_users", "users")
  end
end
