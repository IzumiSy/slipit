class Api::BookmarksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i(create)
  before_action :set_default_headers

  def create
    bookmark = Bookmark.new(api_bookmark_permitted_params)

    if bookmark.save
      render json: bookmark
    else
      render json: {
        errors: bookmark.errors.full_messages
      }
    end
  end

  private

  def api_bookmark_permitted_params
    params.require(:bookmark).permit(:title, :url, :description)
  end

  def set_default_headers
    response.headers['Content-Type'] = 'application/vnd.api-json'
  end
end
