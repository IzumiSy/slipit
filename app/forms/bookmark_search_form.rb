class BookmarkSearchForm < ApplicationForm
  attr_accessor :query, :user

  validates :user, presence: true

  def call
    validate!
    @user.bookmarks.search(@query)
  rescue ActiveModel::ValidationError
    @user.bookmarks
  end
end
