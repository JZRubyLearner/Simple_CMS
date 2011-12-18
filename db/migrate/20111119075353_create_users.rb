class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string "first_name", :limit=>25
      t.string "first_name", :limit=>50
      t.string "email", :default=>"", :null=>false
      t.string "password", :limit=> 40

      t.boolean "is_admin", :default=>false
      t.integer "age", :default=>4
      t.text "description"
      t.date "dob"
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
