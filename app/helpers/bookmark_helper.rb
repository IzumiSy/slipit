module BookmarkHelper
  def favicon(url)
    "http://favicon.hatena.ne.jp/?url=#{url}"
  end

  def search_title
    if @bookmark_search.query
      return "Search: \"#{@bookmark_search.query}\""
    else
      nil
    end
  end
end
