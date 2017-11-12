class BookmarkCounterJob < ApplicationJob
  queue_as :default

  def perform(tags)
    Tag.where(id: tags).each do |tag|
      tag.update(bookmark_counts: tag.bookmarks.count)
    end
  end
end
