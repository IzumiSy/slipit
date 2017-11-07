class Bookmark < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :url, url: true
  end
end
