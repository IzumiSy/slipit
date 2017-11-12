class BookmarkCounterJob < ApplicationJob
  queue_as :default

  def perform(tags)
    Tag.where(id: tags).each do |tag|
      tag.update(bookmark_counts: tag.bookmark_counts)
    end
  end
end
