# frozen_string_literal: true

class BookmarkSearchForm < ApplicationForm
  attr_accessor :query, :user

  validates :user, presence: true

  def call(query)
    validate!
    Bookmark.search(query)
  rescue ActiveModel::ValidationError
    []
  end
end
