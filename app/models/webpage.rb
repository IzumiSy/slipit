class Webpage
  def initialize(page)
    @page = page
  end

  def description
    @page
      .at('meta[property="og:description"],meta[name="description"]')
      &.attributes['content']&.value
  rescue
    ''
  end

  def title
    return '(no title)' unless defined?(@page.title)
    @page.title
  end
end
