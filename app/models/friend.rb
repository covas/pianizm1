class Friend < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :idfriend

  belongs_to :user

  #validates_uniqueness_of :idfriend

end
