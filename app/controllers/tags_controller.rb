class TagsController < ApplicationController
  before_action :require_login

  def index
    @tag = Tag.new
    @tags = current_user.tags.order_by_bookmark_counts
  end

  def create
    tag = Tag.new(create_tag_permitted_params)
    tag.user = current_user

    redirect_to tags_path, tag.save ?
      { notice: "Successfully added a new tag" } :
      { alert: "Failed to add a new tag" }
  end

  private

  def create_tag_permitted_params
    params.require(:tag).permit(:name)
  end
end
