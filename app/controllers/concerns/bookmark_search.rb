# frozen_string_literal: true

module BookmarkSearch
  extend ActiveSupport::Concern

  included do
    before_action :prepare_bookmark_search
  end

  def prepare_bookmark_search
    @bookmark_search = BookmarkSearchForm.new(bookmark_search_permitted_params)
    @bookmark_search.user = current_user
  end

  private

  def bookmark_search_permitted_params
    params[:bookmark_search_form]&.permit(:query)
  end
end
