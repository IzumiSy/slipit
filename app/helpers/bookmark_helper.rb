module BookmarkHelper
  def favicon(url)
    "https://www.google.com/s2/favicons?domain=#{url}"
  end

  def search_title
    if @bookmark_search.query
      return "Search: \"#{@bookmark_search.query}\""
    else
      nil
    end
  end
end
