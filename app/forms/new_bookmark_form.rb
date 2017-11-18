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
    { title: @title, url: @url, description: @description}
  end

  private

  def resolve!
    scraper = Mechanize.new
    scraper.get(@url)

    @title =
      if defined?(scraper.page.title)
        scraper.page.title
      else
        '(no title)'
      end
    @description = scraper.page
      .at('meta[property="og:description"]')&.attributes['content']&.value
  rescue Mechanize::ResponseCodeError => e
    @title = e.page.title
  end
end
