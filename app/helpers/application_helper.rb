module ApplicationHelper
  def metatag_configs
    {
      site: 'Slip.it',
      title: 'Your online bookmarks never be social.',
      description: 'Your online bookmarks never be social.',
      keywords: 'Bookmark, Social, Online',
      reverse: true,
      og: {
        title: 'Slip.it',
        type: 'website',
        url: 'http://slipit.me',
        image: image_url('logo_small.png')
      }
    }
  end
end
