class Bookmarks::UrlsController < ApplicationController
  before_action :require_login

  def create
    new_bookmark =
      NewBookmarkForm.new(permitted_params)

    if (bookmark = Bookmark.find_by(url: new_bookmark.url))
      bookmark.created_at = Time.now
      bookmark.save
      redirect_to edit_bookmark_url(bookmark.id), notice: 'Submitted URL is already bookmarked'
      return
    end

    if new_bookmark.call
      redirect_to new_bookmark_url(new_bookmark.to_h)
    else
      redirect_to bookmarks_path, alert: 'Failed to add a new bookmark'
    end
  end

  private

  def permitted_params
    params.require(:new_bookmark_form).permit(:url)
  end
end
