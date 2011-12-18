class CreatePages < ActiveRecord::Migration
  def self.up

    create_table :pages do |t|
      t.integer "subject_id", :null=>false
      t.string "name", :limit=>50
      t.string "permalink", :limit=>50
      t.integer "position"
      t.boolean "visible", :default=>true

      t.timestamps
    end

    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end

  def self.down
    drop_table :pages
  end
end
