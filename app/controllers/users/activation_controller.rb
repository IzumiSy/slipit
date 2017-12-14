class Users::ActivationController < ApplicationController
  def show
    user = User.find_by!(activation_token: params.require(:token))
    user_activation = UserActivation.new(user: user)

    if user_activation.activated?
      redirect_to sign_in_path, notice: 'Your account has already activated'
      return
    end

    sign_in user_activation.call
    redirect_to root_path, notice: 'Your account has successfull activated!'
  rescue ActiveRecord::RecordNotFound => _e
    redirect_to sign_in_path
  end
end
