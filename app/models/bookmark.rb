class Bookmark < ApplicationRecord
  include SearchCop

  belongs_to :user
  has_and_belongs_to_many :tags

  with_options presence: true do
    validates :title
    validates :url, url: true, uniqueness: true
  end

  after_create Tags::BookmarkCounter.new
  after_update Tags::BookmarkCounter.new
  after_destroy Tags::BookmarkCounter.new

  scope :order_by_created_at, -> { order("created_at DESC") }

  search_scope :title_search { attributes :title }
  search_scope :url_search { attributes :url }
  search_scope :description_search { attributes :description }
end
