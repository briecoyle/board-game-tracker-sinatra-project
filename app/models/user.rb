class User < ActiveRecord::Base
  has_and_belongs_to_many :board_games

  has_secure_password
  validates :username, uniqueness: true
  validates :username, presence: true
end
