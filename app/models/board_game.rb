class BoardGame < ActiveRecord::Base
  has_many :users_board_games
  has_many :users, through: :users_board_games

  validates_uniqueness_of :name

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find {|user| user.slug == slug}
  end
end
