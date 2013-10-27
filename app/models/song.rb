class Song < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :pianizm
  belongs_to :user
  belongs_to :category
  belongs_to :song_list
  attr_accessible :name,:length,:score,:author
end
