class Bookmarks::UpdateCounters
  def after_create(bookmark)
    update_bookmark_tags_counts(bookmark.user.tags)
    increment_user_bookmark_counts(bookmark.user.id)
  end

  def after_update(bookmark)
    update_bookmark_tags_counts(bookmark.user.tags)
  end

  def after_destroy(bookmark)
    update_bookmark_tags_counts(bookmark.user.tags)
    decrement_user_bookmark_counts(bookmark.user.id)
  end

  private

  def decrement_user_bookmark_counts(user_id)
    if (user = User.find(user_id))
      user.decrement!(:bookmark_counts)
    end
  end

  def increment_user_bookmark_counts(user_id)
    if (user = User.find(user_id))
      user.increment!(:bookmark_counts)
    end
  end

  def update_bookmark_tags_counts(tags)
    Tag.where(id: tags).each do |tag|
      bookmark_counts = tag.bookmarks.count
      if bookmark_counts.zero?
        tag.destroy
      else
        tag.update(bookmark_counts: bookmark_counts)
      end
    end
  end
end
