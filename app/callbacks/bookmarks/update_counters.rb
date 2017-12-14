class Bookmarks::UpdateCounters
  def after_create(bookmark)
    update_bookmark_tags_counts(bookmark.user.tags)
    increase_user_bookmark_counts(bookmark.user.id)
  end

  def after_update(bookmark)
    update_bookmark_tags_counts(bookmark.user.tags)
  end

  def after_destroy(bookmark)
    update_bookmark_tags_counts(bookmark.user.tags)
    decrease_user_bookmark_counts(bookmark.user.id)
  end

  private

  def decrement_user_bookmark_counts(user_id)
    if user = User.find(user_id)
      user.decrement!(:bookmark_counts)
    end
  end

  def increment_user_bookmark_counts(user_id)
    if user = User.find(user_id)
      user.increment!(:bookmark_counts)
    end
  end

  def update_bookmark_tags_counts(tags)
    Tags::BookmarkCounterJob.perform_later(tags.pluck(:id))
  end
end
