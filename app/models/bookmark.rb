class Bookmark < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  with_options presence: true do
    validates :title
    validates :url, url: true
  end

  after_create :increase_tag_counters
  after_destroy :decrease_tag_counters

  private

  def increase_tag_counters
    self.tags.each { |tag| tag.bookmark_counts += 1 }
  end

  def decrease_tag_counters
    self.tags.each { |tag| tag.bookmark_counts -= 1 }
  end
end
