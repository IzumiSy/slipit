class Api::BookmarkController < ApplicationController
  def create
    @bookmark = Bookmark.create(bookmark_params)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :description)
  end
end
