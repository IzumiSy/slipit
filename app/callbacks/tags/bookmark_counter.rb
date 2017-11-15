class Tags::BookmarkCounter
  def after_create(record)
    perform_later(record.user.tags)
  end

  def after_update(record)
    perform_later(record.user.tags)
  end

  def after_destroy(record)
    perform_later(record.user.tags)
  end

  private

  def perform_later(tags)
    Tags::BookmarkCounterJob.perform_later(tags.pluck(:id))
  end
end
