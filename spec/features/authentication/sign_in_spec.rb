require 'rails_helper'

feature 'Sign in' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'with valid credentials' do
    sign_in user
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with invalid credentials' do
    sign_in user, password: 'wrongpassword'
    expect(page).to have_content('Invalid Email or password.')
  end
end
