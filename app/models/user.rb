class User < ApplicationRecord
  include Clearance::User

  has_many :bookmarks, dependent: :destroy
  has_many :tags, dependent: :destroy
end
