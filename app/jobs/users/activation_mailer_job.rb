class Users::ActivationMailerJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    user.activation_token = Clearance::Token.new
    user.save
    UsersMailer.activation(user).deliver
  end
end
