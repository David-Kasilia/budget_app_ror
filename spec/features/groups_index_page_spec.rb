require 'rails_helper'

RSpec.describe 'Group index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'David', email: 'david001@gmail.com', password: 'password')
    @group = Group.create(author: @user, name: 'Food', icon: 'https://icon_url')
    visit new_user_session_path
    fill_in 'Email', with: 'david001@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit user_group_index_path(@user.id)
  end

  scenario 'I can see the group card.' do
    expect(page).to have_css('div.card')
  end
  scenario 'I can see the page title.' do
    expect(page).to have_content 'Categories'
  end
  scenario 'I can see the group name.' do
    expect(page).to have_content 'Food'
  end
  scenario 'I can see the group total transaction.' do
    expect(page).to have_content 'Total: $'
  end
end
