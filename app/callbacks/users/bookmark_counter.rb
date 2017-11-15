class Users::BookmarkCounter
  def after_create(record)
    perform_later(record.user.id)
  end

  def after_destroy(record)
    perform_later(record.user.id)
  end

  private

  def perform_later(user_id)
    Users::BookmarkCounterJob.perform_later(user_id)
  end
end
