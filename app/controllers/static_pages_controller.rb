class StaticPagesController < ApplicationController
  before_action :require_login

  #
  # NOTE: Only this controller does not follow a RESTful resource rule
  #

  def bookmarklet
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
end
