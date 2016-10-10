class BookmarkController < ApplicationController
  include ApiActions

  def index
    @bookmarks = []
  end

  def new
  end

  def edit
  end

  def show
  end

  def search
    @search_results = []
  end
end
