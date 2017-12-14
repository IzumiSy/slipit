module BookmarkHelper
  def favicon(url)
    "https://www.google.com/s2/favicons?domain=#{url}"
  end

  def bookmark_search
    search = BookmarkSearchForm.new
    search.user = current_user
    search
  end

  def search_title
    if @bookmark_search.query
      return "Search: \"#{@bookmark_search.query}\""
    else
      nil
    end
  end

  def set_meta_title
    if @bookmark_search.query.present?
      set_meta_tags title: ['Bookmarks', "\"#{@bookmark_search.query}\""]
    else
      set_meta_tags title: 'Bookmarks'
    end
  end
end
