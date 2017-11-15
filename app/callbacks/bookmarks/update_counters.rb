class Bookmarks::UpdateCounters
  def after_create(bookmark)
    update_user_bookmark_counts(bookmark.user.id)
    update_bookmark_tags_counts(bookmark.user.tags)
  end

  def after_update(bookmark)
    update_bookmark_tags_counts(bookmark.user.tags)
  end

  def after_destroy(bookmark)
    update_user_bookmark_counts(bookmark.user.id)
    update_bookmark_tags_counts(bookmark.user.tags)
  end

  private

  def update_user_bookmark_counts(user_id)
    Users::BookmarkCounterJob.perform_later(user_id)
  end

  def update_bookmark_tags_counts(tags)
    Tags::BookmarkCounterJob.perform_later(tags.pluck(:id))
  end
end
