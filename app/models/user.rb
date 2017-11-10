class User < ApplicationRecord
  include Clearance::User

  has_many :bookmarks, dependent: :destroy
end
