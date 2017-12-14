class NewBookmark < ApplicationForm
  attr_accessor :url, :title, :description

  validates :url, presence: true, url: true

  def call
    validate!
    resolve!
    true
  rescue ActiveModel::ValidationError
    false
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
  rescue Mechanize::ResponseCodeError => e
    @title = e.page.title
  end
end
