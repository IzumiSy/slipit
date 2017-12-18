module ApplicationHelper
  def metatag_configs
    {
      site: 'Slip.it',
      title: 'Your online bookmarks never be social.',
      description: 'Slip.it is the 100% private, simple online bookmarking service.',
      keywords: 'Bookmark, Social, Online',
      reverse: true,
      og: {
        title: 'Slip.it',
        description: :description,
        type: 'website',
        url: 'http://slipit.me',
        image: image_url('logo_cloud_big.png')
      }
    }
  end
end
