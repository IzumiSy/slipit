module ApplicationHelper
  def meta_tag_configs
    {
      title: "Slip.it",
      description: "Your online bookmarks never be social.",
      keywords: "Bookmark, Social, Online",
      og: {
        title: "Slip.it",
        type: "website",
        url: "http://slipit.in",
        image: asset_path("logo_small.png")
      }
    }
  end
end
