class Users::BookmarksController < ApplicationController
  before_action :require_login

  def destroy
    current_user.bookmarks.delete_all
    redirect_to users_me_path, notice: 'All your bookmarks have successfully deleted'
  end
end
