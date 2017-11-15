class Users::ActivationQueue
  def after_create(user)
    Users::ActivationMailerJob.perform(user.id)
  end
end
