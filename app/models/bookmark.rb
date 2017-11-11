class Bookmark < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  with_options presence: true do
    validates :title
    validates :url, url: true
  end

  after_create do
    self.tags.each do |tag|
      tag.increment!(:bookmark_counts)
    end
  end

  before_destroy do
    self.tags.each do |tag|
      return unless tag.bookmark_counts
      tag.decrement!(:bookmark_counts)
    end
  end
end
