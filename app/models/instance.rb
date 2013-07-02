class Instance < ActiveRecord::Base

  #validates :course, :presence => true
  #validates :instructor, :presence => true
  #validates :terms, :acceptance => true

  validates :course, :presence => true, :length => { :maximum => 50 }
  #validates :instructor, :presence => true, :length => { :maximum => 50 }
  validates :terms, :acceptance => true


  attr_accessible :course, :instructor, :terms

end
