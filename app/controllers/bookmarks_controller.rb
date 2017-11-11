class BookmarksController < ApplicationController
  before_action :require_login

  def index
    @bookmarks = current_user.bookmarks.preload(:tags)
  end

  def new
    @tags = current_user.tags.order_by_name
    @bookmark = Bookmark.new(new_bookmark_permitted_params)
  end

  def create
    @bookmark = Bookmark.new(bookmark_permitted_params)
    @bookmark.user = current_user

    if @bookmark.save
      redirect_to bookmarks_path, notice: "New bookmark added"
    else
      render :new
    end
  end

  def edit
    @tags = current_user.tags.order_by_name
    @bookmark = Bookmark.find(params.require(:id))
  end

  def update
    bookmark = Bookmark.find(params.require(:id))

    if bookmark.update(bookmark_permitted_params)
      redirect_to bookmarks_path, notice: "Bookmark updated"
    else
      render :edit
    end
  end

  def destroy
    bookmark = Bookmark.find(params.require(:id))
    bookmark.destroy
    redirect_to bookmarks_path, notice: "Bookmark removed"
  end

  private

  def bookmark_permitted_params
    params.require(:bookmark).permit(:title, :url, :description, tag_ids: [])
  end

  def new_bookmark_permitted_params
    params.permit(:title, :url)
  end
end
