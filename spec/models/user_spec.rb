require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'David', email: 'david001@gmail.com', password: 'password')
  end

  scenario 'valid with name' do
    expect(@user).to be_valid
  end

  scenario 'valid name' do
    expect(@user.name).to eq 'David'
  end
end
