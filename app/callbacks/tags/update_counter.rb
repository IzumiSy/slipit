class Tags::UpdateCounter
  def after_create(tag)
    # update_user_tag_counts(tag)
  end

  def after_destroy(tag)
    # update_user_tag_counts(tag)
  end
end
