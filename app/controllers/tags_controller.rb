class TagsController < ApplicationController
  include BookmarkSearch

  before_action :require_login

  def show
    @tag = Tag.find(params.require(:id))
    @bookmarks = @tag.bookmarks.order_by_created_at
  end

  def index
    @tag = Tag.new
    @tags = current_user.tags.order_by_bookmark_counts
  end

  def create
    tag = Tag.new(create_tag_permitted_params)
    tag.user = current_user

    if tag.save
      redirect_to tags_path, notice: "Successfully added a new tag"
    else
      redirect_to tags_path, alert: "Failed to add a new tag"
    end
  end

  private

  def create_tag_permitted_params
    params.require(:tag).permit(:name)
  end
end
