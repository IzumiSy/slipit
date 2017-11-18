class Users::MeController < ApplicationController
  include BookmarkSearch

  before_action :require_login

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(update_user_permitted_params)
      redirect_to users_me_path, notice: "Your account has successfully updated"
    else
      redirect_to users_me_path, alert: "Failed to update your account"
    end
  end

  def destroy
    user = current_user
    sign_out
    user.delete
    redirect_to sign_in_path, notice: 'Your account has successfully deleted'
  end

  private

  def update_user_permitted_params
    params.require(:user).permit(:email)
  end
end
