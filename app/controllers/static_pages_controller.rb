class StaticPagesController < ApplicationController
  #
  # NOTE: Only this controller does not follow a RESTful resource rule
  #

  def bookmarklet
    @bookmarklet_js = <<-BOOKMARKLET
javascript:(
  function() {
    alert('Hello');
  }
)();
    BOOKMARKLET
  end
end
