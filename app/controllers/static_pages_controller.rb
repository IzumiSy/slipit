class StaticPagesController < ApplicationController
  #
  # NOTE: Only this controller does not follow a RESTful resource rule
  #

  def bookmarklet
    @bookmarklet_js = <<-BOOKMARKLET
javascript:(
  function() {
    var request = new XMLHttpRequest();
    request.open('POST', 'http://#{request.host}:#{request.port}#{api_bookmarks_path}');
    request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    request.onreadystatechange = function() {
      if (request.readyState === 4) {
        if (request.status === 200) {
          alert("Bookmark added");
        } else {
          alert("Failed to add this page to bookmarks")
        }
      }
    };
    request.send(JSON.stringify({
      "bookmark": {
        "title": document.title,
        "url": location.href
      }
    }));
  }
)();
    BOOKMARKLET
  end
end
