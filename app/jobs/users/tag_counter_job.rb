class Users::TagCounterJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    user.update(tag_counts: user.tags.count)
  end
end
