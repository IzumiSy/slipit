require 'rails_helper'

RSpec.feature "Bookmark", type: :feature do
  before do
    WebMock.disable!
  end

  background do
    create(:activated_user)
  end

  scenario 'can submit a new bookmark' do
    visit root_path
    click_on 'Log in'

    fill_in 'session_email', with: 'activated_user@example.com'
    fill_in 'session_password', with: 'password'
    click_on 'Login'

    click_on 'Add a new bookmark'

    fill_in 'new_bookmark_url', with: 'https://example.com'
    click_on 'Next'
    take_screenshot

    expect(page).to have_content 'Title'
    expect(page).to have_selector("input#bookmark_title[value='Example Domain']")

    expect(page).to have_content 'Url'
    expect(page).to have_selector("input#bookmark_url[value='https://example.com']")

    click_on 'Submit'
    expect(page).to have_content 'New bookmark added'
  end
end
