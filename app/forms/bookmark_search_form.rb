class BookmarkSearchForm < ApplicationForm
  attr_accessor :query

  validates :query, presence: true

  def call
    validate!
    Bookmark.search(@query)
  rescue ActiveModel::ValidationError
    []
  end
end
