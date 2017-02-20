class BoardGame < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
  validates :min_players, presence: true
  validates :max_players, presence: true

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find {|user| user.slug == slug}
  end
end
