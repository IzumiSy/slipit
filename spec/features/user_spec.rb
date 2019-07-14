require 'rails_helper'

RSpec.feature "User", type: :feature do
  background do
    create(:activated_user)
    create(:unactivated_user)
  end

  scenario 'can get logged in if activated' do
    visit root_path
    click_on 'Log in'
    expect(page).to have_content 'Login to Slip.it'

    fill_in 'session_email', with: 'activated_user@example.com'
    fill_in 'session_password', with: 'password'
    click_on 'Login'
    expect(page).to have_content 'Add a new bookmark'
  end

  scenario 'can not get logged in if not activated' do
    visit root_path
    click_on 'Log in'
    expect(page).to have_content 'Login to Slip.it'

    fill_in 'session_email', with: 'unactivated_user@example.com'
    fill_in 'session_password', with: 'password'
    click_on 'Login'
    expect(page).to have_content 'You must confirm your email address'
  end

  scenario 'can not get logged in if not registered' do
    visit root_path
    click_on 'Log in'
    expect(page).to have_content 'Login to Slip.it'

    fill_in 'session_email', with: 'unregistered_user@example.com'
    fill_in 'session_password', with: 'password'
    click_on 'Login'
    expect(page).to have_content 'Bad email or password'
  end
end
