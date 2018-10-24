class NewBookmark < ApplicationForm
  attr_accessor :url, :title, :description

  validates :url, presence: true, url: true

  Result = Struct.new(:failed?, :reason)

  def call
    validate!
    resolve!
    succeeded
  rescue ActiveModel::ValidationError
    failed 'Please check if the provided URL is valid.'
  rescue Mechanize::UnauthorizedError
    failed 'Provided URL looks to require authorization.'
  rescue
    failed 'This is an internal server error.'
  end

  def to_h
    { title: @title, url: @url, description: @description }
  end

  private

  def resolve!
    scraper = Mechanize.new
    scraper.get(@url)
    webpage = Webpage.new(scraper.page)
    @title = webpage.title
    @description = webpage.description
  end

  def succeeded
    Result.new(false, nil)
  end

  def failed(reason)
    Result.new(true, reason)
  end
end
