class Tag < ApplicationRecord
  has_and_belongs_to_many :bookmarks
  belongs_to :user

  scope :order_by_name, -> { order(:name) }
  scope :order_by_bookmark_counts, -> {
    order("bookmark_counts DESC, name")
  }
end
