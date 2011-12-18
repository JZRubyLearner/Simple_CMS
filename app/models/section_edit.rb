class SectionEdit < ActiveRecord::Base

  belongs_to :editor, :class_name => "User", :foreign_key=> "user_id"
  belongs_to :section
end
