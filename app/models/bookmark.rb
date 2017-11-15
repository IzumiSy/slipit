class Bookmark < ApplicationRecord
  include SearchCop

  belongs_to :user
  has_and_belongs_to_many :tags

  with_options presence: true do
    validates :title
    validates :url, url: true, uniqueness: true
  end

  after_create Bookmarks::UpdateCounters.new
  after_update Bookmarks::UpdateCounters.new
  after_destroy Bookmarks::UpdateCounters.new

  scope :order_by_created_at, -> { order('created_at DESC') }

  search_scope :search do
    attributes all: %i[title url description]
  end
end
