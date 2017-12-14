module BookmarkSearch
  extend ActiveSupport::Concern

  included do
    before_action do
      @bookmark_search = BookmarkSearchForm.new(bookmark_search_permitted_params)
      @bookmark_search.user = current_user
    end
  end

  private

  def bookmark_search_permitted_params
    params[:bookmark_search_form]&.permit(:query)
  end
end
