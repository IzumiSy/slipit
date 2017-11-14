class NewBookmarkForm < ApplicationForm
  attr_accessor :url, :title

  validates :url, presence: true, url: true

  def call
    validate!
    resolve!
    true
  rescue ActiveModel::ValidationError
    false
  end

  def to_h
    { title: @title, url: @url }
  end

  private

  def resolve!
    #
    # TODO
    #
  end
end
