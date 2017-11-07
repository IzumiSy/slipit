class Bookmark < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :url
    validates :description
  end
end
