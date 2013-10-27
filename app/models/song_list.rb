class SongList < ActiveRecord::Base
  has_many :songs
  belongs_to :user

  # attr_accessible :title, :body
end
