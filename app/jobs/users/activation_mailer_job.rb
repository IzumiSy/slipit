class Users::ActivationMailerJob < ApplicationJob
  queue_as :default

  def perform
    user = User.find(user_id)
    user.activation_token = Clearance::Token.new
    user.update
    # UsersMailer.activation(user).deliver
  end
end
