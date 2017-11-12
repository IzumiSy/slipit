class Bookmark < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  with_options presence: true do
    validates :title
    validates :url, url: true, uniqueness: true
  end

  after_create Tags::BookmarkCounter.new
  after_update Tags::BookmarkCounter.new
  after_destroy Tags::BookmarkCounter.new
end
