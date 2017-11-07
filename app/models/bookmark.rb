class Bookmark < ApplicationRecord
  with_option presence: true do
    validates :title
    validates :url
    validates :description
  end
end
