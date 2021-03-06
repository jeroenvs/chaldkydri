class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :body
  has_many :comments
end
