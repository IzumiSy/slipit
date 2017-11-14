class StaticPagesController < ApplicationController
  include BookmarkSearch

  #
  # NOTE: Only this controller does not follow a RESTful resource rule
  #

  def bookmarklet
    require_login

    host = Rails.env.development? ?
      "localhost:#{request.port}" : request.host
    @src = <<-SRC
  javascript:(
    function() {
      window.open('http://#{host}#{new_bookmark_path}' +
        '?title=' + encodeURI(document.title) + '&url=' + encodeURI(location.href));
    }
  )();
      SRC
    @bookmarklet = @src.delete("\n").delete(" ")
  end

  def landing
    render layout: "landing"
  end
end
