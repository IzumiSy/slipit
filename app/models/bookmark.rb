class Bookmark < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :url, url: true
  end
end
