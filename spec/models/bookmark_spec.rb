require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'validations' do
    subject { create(:bookmark) }

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
  end
end
