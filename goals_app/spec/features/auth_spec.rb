# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "testing"
      fill_in 'Password', :with => "biscuits"
      click_on "create user"
    end
    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content "testing"
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "testing"
      click_on "create user"
    end

    scenario "re-renders the new user page after failed signup" do
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end
end






feature 'logging in' do
  # let(:user) do 
  #   FactoryBot.create(:user, username: "testing", password: "biscuits")
  # end
  # 
  # before(:each) do
  #   visit new_session_url
  #   fill_in 'Username', :with => "testing"
  #   fill_in 'Password', :with => "biscuits"
  #   # save_and_open_page
  #   click_on "sign in"
  # end
  
  scenario 'shows username on the homepage after login' do
    FactoryBot.create(:user, username: "testing", password: "biscuits")
    visit new_session_url
    fill_in 'Username', :with => "testing"
    fill_in 'Password', :with => "biscuits"
    # save_and_open_page
    click_on "sign in"
    # debugger
    save_and_open_page
    expect(page).to have_content "testing"
  end
end

feature 'logging out' do
  let(:user) do 
    FactoryBot.create(user: {username: "testing", password: "biscuits"})
  end
  before(:each) do
    visit new_session_url
    fill_in 'Username', :with => "testing"
    fill_in 'Password', :with => "biscuits"
    click_on "sign in"
    click_on "sign out"
  end
  scenario 'begins with a logged out state' do 
    expect(current_path).to eq(new_session_path)
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    expect(page).to have_no_content "testing"
  end
end