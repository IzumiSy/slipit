class Users::BookmarkCounterJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    user.update(bookmark_counts: user.bookmarks.count)
  end
end
