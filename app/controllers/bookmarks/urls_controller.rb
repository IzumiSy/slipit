class Bookmarks::UrlsController < ApplicationController
  before_action :require_login

  def create
    new_bookmark =
      NewBookmark.new(permitted_params)

    if (bookmark = current_user.bookmarks.find_by(url: new_bookmark.url))
      bookmark.created_at = Time.now
      bookmark.save
      redirect_to edit_bookmark_url(bookmark.id), notice: 'Submitted URL is already bookmarked'
      return
    end

    result = new_bookmark.call
    if result.failed?
      redirect_to bookmarks_path, alert: result.reason
      return
    end

    redirect_to new_bookmark_url(new_bookmark.to_h)
  end

  private

  def permitted_params
    params.require(:new_bookmark).permit(:url)
  end
end
