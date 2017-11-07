class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(create_bookmark_permitted_params)

    if @bookmark.save
      redirect_to bookmarks_path, notice: "New bookmark added"
    else
      render :new
    end
  end

  private

  def create_bookmark_permitted_params
    params.require(:bookmark).permit(:title, :description)
  end
end
