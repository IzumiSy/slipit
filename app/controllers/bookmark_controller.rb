class BookmarkController < ApplicationController
  include ApiActions

  def index
    @bookmarks = []
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
  end

  def show
  end
end
