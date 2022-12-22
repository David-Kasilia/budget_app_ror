require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.create(name: 'David', email: 'david001@gmail.com', password: 'password')
    @group = Group.create(author: @user, name: 'Food', icon: 'https://icon_url')
    @entity = Entity.create(author: @user, name: 'Chips', amount: 15)
  end

  scenario 'it should be valid' do
    expect(@entity).to be_valid
  end
end
