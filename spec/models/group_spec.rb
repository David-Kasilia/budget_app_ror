require 'rails_helper'

RSpec.describe Group, type: :model do
 before(:each) do
        @user = User.create(name: 'David', email:'david001@gmail.com', password:'password')
        @group = Group.create(author: @user, name: 'Food', icon: 'https://icon_url')
    end

    scenario 'valid group' do
        expect(@group).to be_valid
    end
end
