class TwitterUser < ActiveRecord::Base
  has_many :tweets
  validates :username, uniqueness: true
end
