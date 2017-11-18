class Tags::UpdateCounter
  def after_create(tag)
    update_user_tag_counts(tag)
  end

  def after_destroy(tag)
    update_user_tag_counts(tag)
  end

  private

  def update_user_tag_counts(tag)
    Users::TagCounterJob.perform_later(tag.user_id)
  end
end
