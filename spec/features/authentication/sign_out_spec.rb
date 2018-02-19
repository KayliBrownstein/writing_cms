require 'spec_helper'

feature 'Sign out' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'always works' do
    sign_in user
    sign_out
    expect(page).to have_content('Signed out successfully.')
  end
end
