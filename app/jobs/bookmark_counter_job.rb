class BookmarkCounterJob < ApplicationJob
  queue_as :default

  def perform(tags)
    Tag.where(id: tags).each do |tag|
      bookmark_counts = tag.bookmark_counts
      if bookmark_counts > 0
        tag.update(bookmark_counts: bookmark_counts)
      else
        tag.delete
      end
    end
  end
end
