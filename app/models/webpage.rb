class Webpage
  def initialize(page)
    @page = page
  end

  def description
    og_description = @page
      .at('meta[property="og:description"]')
      &.attributes.try('content')&.value
    content_description = @page
      .at('meta[name="description"]')
      &.attributes.try('content')&.value
    binding.pry
    og_description || content_description
  end

  def title
    if defined?(@page.title)
      @page.title
    else
      '(no title)'
    end
  end
end
