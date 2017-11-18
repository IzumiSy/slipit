class Users::MeController < ApplicationController
  include BookmarkSearch

  before_action :require_login

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    user = current_user
    sign_out
    user.delete
    redirect_to sign_in_path, notice: 'Your account has successfully deleted'
  end
end
