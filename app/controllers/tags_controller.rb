class TagsController < ApplicationController
  before_action :require_login

  def index
    # TODO
  end

  def create
    # TODO
  end

  private

  def create_tag_permitted_params
    params.require(:name)
  end
end
