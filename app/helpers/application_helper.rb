module ApplicationHelper
  def metatag_configs
    {
      title: 'Slip.it',
      description: 'Your online bookmarks never be social.',
      keywords: 'Bookmark, Social, Online',
      og: {
        title: 'Slip.it',
        type: 'website',
        url: 'http://slipit.in',
        image: image_url('logo_small.png')
      }
    }
  end
end
