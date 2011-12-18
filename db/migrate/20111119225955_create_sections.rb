class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.integer "page_id", :null=>false
      t.string "name", :limit=>50
      t.integer "position"
      t.boolean "visible", :default=>true
      t.string "content_type", :limit=>128
      t.text "content"

      t.timestamps
    end

    add_index("sections", "page_id")
  end

  def self.down
    drop_table :sections
  end
end
