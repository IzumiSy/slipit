class NewBookmarkForm < ApplicationForm
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

    @description = scraper.page
      .at('meta[property="og:description"]')&.attributes['content']&.value
    if defined?(scraper.page.title)
      @title = scraper.page.title
    else
      @title = '(no title)'
    end
  rescue Mechanize::ResponseCodeError => e
    @title = e.page.title
  end
end
