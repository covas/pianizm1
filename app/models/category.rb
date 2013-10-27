class Category < ActiveRecord::Base
  has_many :songs
  # attr_accessible :title, :body
end
