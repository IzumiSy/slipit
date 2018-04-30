class BookmarksController < ApplicationController
  before_action :require_login
  before_action :prepare_current_user_tags, only: %i[new create edit update]

  def index
    @bookmark_search = BookmarkSearch.new(bookmark_search_permitted_params)
    @bookmark_search.user = current_user
    @bookmarks = @bookmark_search.call.order_by_created_at.eager_load(:tags)
    @new_bookmark = NewBookmark.new
    @user = current_user
    @is_listview = session[:is_listview]
  end

  def new
    @bookmark = Bookmark.new(new_bookmark_permitted_params)
  end

  def create
    @bookmark =
      Bookmark.new(create_bookmark_permitted_params.merge(user: current_user))

    if @bookmark.save
      redirect_to bookmarks_path, notice: 'New bookmark added'
    else
      render :new
    end
  end

  def edit
    @bookmark = current_user.bookmarks.find(params.require(:id))
  end

  def update
    bookmark = current_user.bookmarks.find(params.require(:id))

    if bookmark.update(create_bookmark_permitted_params)
      redirect_to bookmarks_path, notice: 'Bookmark updated'
    else
      render :edit
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find(params.require(:id))
    bookmark.destroy
    redirect_to bookmarks_path, notice: 'Bookmark removed'
  end

  private

  def prepare_current_user_tags
    @tags = current_user.tags.order_by_name
  end

  def bookmark_search_permitted_params
    params[:bookmark_search]&.permit(:query)
  end

  def create_bookmark_permitted_params
    params.require(:bookmark).permit(:title, :url, :description, tag_ids: [])
  end

  def new_bookmark_permitted_params
    params.permit(:title, :url, :description)
  end
end
