class Users::ActivationQueue
  def after_create(user)
    user = User.find(user.id)
    user.activation_token = Clearance::Token.new
    user.save
    UsersMailer.activation(user).deliver_now
  end
end
