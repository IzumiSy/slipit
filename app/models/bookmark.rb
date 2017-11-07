class Bookmark < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :url, url: true
    validates :description
  end
end
