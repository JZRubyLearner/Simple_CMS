

subject = Subject.find(1)

first_page = Page.new(:name=>"First Page", :permalink=>"First", :position=>1)

subject.page = first_page

subject.page
first_page.subject

# one to many

subject.pages << page

# to delete:
subject.page.delete(page)
# or
subject.pages.clear

subject.pages.size
subject.pages.delete(second_page)
subject.pages[0]


subjects.visible DSC

Subject.where(:visible => true).order("subjects.position ASC").limit(1).offset(1)

# ---------------------------------
# many to many rich
> rails generate model SectionEdit

# migration:
create_table :section_edits do |t|
  t.references :user
  t.references :section
  t.string "summary"
  t.timestamps
end
add_index :section_edit, ['user_id','section_id']

> rake db:migrate

# models - SectionEdit
  belongs_to :editor, :class_name => "User", :foreign_key=> "user_id"
  belongs_to :section
# model - User
has_many :section_edits
has_many has_many :sections, :through => :section_edits
# model - Sections
has_many :section_edits
has_many :editors, :through => :section_edits, :class_name => "User"


# console
me = User.find(1)
section = Section.Create(:name => "Section one", :position => 1)
edit = SectionEdit.new
edit.summary = "Test Edit"
section.section_edits << edit
edit.editor << me
edit.save
#test
section.section_edits
me.section_edits







