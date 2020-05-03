require 'rails_helper'

RSpec.feature 'Bookmark', type: :feature do
  before do
    WebMock.disable!
  end

  def login_as_activated_user
    visit root_path
    click_on 'Log in'

    fill_in 'session_email', with: 'activated_user@example.com'
    fill_in 'session_password', with: 'password'
    click_on 'Login'
  end

  scenario 'can submit a new bookmark' do
    create(:activated_user)

    login_as_activated_user

    expect(page).to have_content 'Bookmarks (0)'
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
    expect(page).to have_content 'Bookmarks (1)'
  end

  scenario 'can delete a bookmark' do
    create(:bookmark)

    login_as_activated_user

    expect(page).to have_content 'Bookmarks (1)'

    find(".bookmark-item.card").first.hover
    take_screenshot

    find("i.right.floated.remove.icon[data-model='1']").click
    expect(page).to have_content 'Remove a bookmark'

    click_on 'Yes'
    expect(page).to have_content 'Bookmark removed'
    expect(page).to have_content 'Bookmarks (0)'
  end
end
