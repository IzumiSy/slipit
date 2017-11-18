class Tag < ApplicationRecord
  has_and_belongs_to_many :bookmarks
  belongs_to :user

  with_options presence: true do
    validates :name, uniqueness: true
    validates :bookmark_counts
  end

  after_create Tags::UpdateCounter.new
  after_destroy Tags::UpdateCounter.new

  scope :order_by_name, -> { order(:name) }
  scope :order_by_bookmark_counts, -> { order('bookmark_counts DESC') }
end
