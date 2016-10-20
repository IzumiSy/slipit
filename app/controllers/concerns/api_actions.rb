module ApiActions
  extend ActiveSupport::Concern

  included do
    # noop
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
  end

  def update

  end

  def destroy

  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :description)
  end
end
