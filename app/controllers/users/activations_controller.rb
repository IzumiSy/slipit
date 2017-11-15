class Users::ActivationsController < ApplicationController
  def show
    user = User.find_by(activation_token: params.require(:token))

    unless user.activated_at
      user.activated_at = Time.now
      user.save!
      sign_in user
      redirect_to root_path, notice: 'Your account has successfull activated!'
      return
    end

    redirect_to sign_in_path, notice: 'Your account has already activated'
  rescue
    redirect_to sign_up_path
  end
end
