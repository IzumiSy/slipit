class User < ApplicationRecord
  include Clearance::User

  has_many :bookmarks, dependent: :destroy
  has_many :tags, dependent: :destroy

  after_create Users::ActivationQueue.new
end
