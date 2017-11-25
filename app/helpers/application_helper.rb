module ApplicationHelper
  def metatag_configs
    {
      site: 'Slip.it',
      title: 'Your online bookmarks never be social.',
      description: 'Sick and tired of the social network services out there?
        We get you covered! Slip.it is the 100% private, simple online bookmarking service.',
      keywords: 'Bookmark, Social, Online',
      reverse: true,
      og: {
        title: 'Slip.it | Your online bookmarks never be social.',
        description: :description,
        type: 'website',
        url: 'http://slipit.me',
        image: image_url('logo_cloud_big.png')
      }
    }
  end
end
