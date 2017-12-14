class Tag < ApplicationRecord
  has_and_belongs_to_many :bookmarks
  belongs_to :user

  with_options presence: true do
    validates :name, uniqueness: true
    validates :bookmark_counts
  end

  scope :order_by_bookmark_counts, -> { order('bookmark_counts DESC') }
  scope :order_by_name, ->(select: false) do
    if select
      select(:name).order(:name)
    else
      order(:name)
    end
  end
end
