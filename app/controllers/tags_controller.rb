class TagsController < ApplicationController
  before_action :require_login

  def create

  end

  private

  def create_tag_permitted_params
    params.require(:name)
  end
end
