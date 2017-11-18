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
    scraper = Mechanize.new
    scraper.get(@url)
    if defined?(scraper.page.title)
      @title = scraper.page.title
    else
      @title = '(no title)'
    end
  rescue Mechanize::ResponseCodeError => e
    @title = e.page.title
  end
end
