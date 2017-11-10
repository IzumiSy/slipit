class StaticPagesController < ApplicationController
  before_action :require_login

  #
  # NOTE: Only this controller does not follow a RESTful resource rule
  #

  def bookmarklet
    @src = <<-SRC
javascript:(
  function() {
    window.open('http://#{request.host}:#{request.port}/#{new_bookmark_path}' +
      '?title=' + encodeURI(document.title) + '&url=' + encodeURI(location.href));
  }
)();
      SRC
    @bookmarklet = @src.delete("\n").delete(" ")
  end
end
