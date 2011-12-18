class Page < ActiveRecord::Base

  belongs_to :subject, {:foreign_key => "subject_id"}
  has_many :sections
  has_and_belongs_to_many :users


end
