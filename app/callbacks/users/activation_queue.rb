class Users::ActivationQueue
  def after_create(user)
    Users::ActivationMailerJob.perform_later(user.id)
  end
end
