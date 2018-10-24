class Users::ActivationController < ApplicationController
  def show
    user = User.find_by!(activation_token: params.require(:token))
    user_activation = UserActivation.new(user: user)

    unless user_activation.activated?
      sign_in user_activation.call
      redirect_to root_path, notice: 'Your account has successfull activated!'
      return
    end

    redirect_to sign_in_path, notice: 'Your account has already activated'
  rescue ActiveRecord::RecordNotFound => _e
    redirect_to sign_in_path
  end
end
