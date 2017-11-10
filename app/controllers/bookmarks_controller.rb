class BookmarksController < ApplicationController
  before_action :require_login

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_permitted_params)

    if @bookmark.save
      redirect_to bookmarks_path, notice: "New bookmark added"
    else
      render :new
    end
  end

  def edit
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
    params.require(:bookmark).permit(:title, :url, :description)
  end
end
