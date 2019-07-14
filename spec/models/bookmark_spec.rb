require 'rails_helper'

FactoryBot.define do
  factory :user do
    email { "hoge@example.com" }
    password { "password" }
  end

  factory :bookmark do
    user
    title { 'hoge' }
    url { 'https://example.com' }
  end
end

RSpec.describe Bookmark, type: :model do
  describe 'validations' do
    subject { create(:bookmark) }

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
  end
end
