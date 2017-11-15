class Tags::BookmarkCounterJob < ApplicationJob
  queue_as :default

  def perform(tags)
    Tag.where(id: tags).each do |tag|
      bookmark_counts = tag.bookmarks.count
      tag.update(bookmark_counts: bookmark_counts)
      tag.destroy if bookmark_counts.zero?
    end
  end
end
