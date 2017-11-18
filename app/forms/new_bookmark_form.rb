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
    webpage = Webpage.new(scraper.page)
    @title = webpage.title
    @description = webpage.description
  rescue Mechanize::ResponseCodeError => e
    @title = e.page.title
  end

  class Webpage
    def initialize(page)
      @page = page
    end

    def description
      @page
        .at('meta[property="og:description"]')
        &.attributes.try('content')&.value
    end

    def title
      if defined?(@page.title)
        @page.title
      else
        '(no title)'
      end
    end
  end
end
