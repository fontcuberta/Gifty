require 'rails_helper'

describe 'Users auth' do
  context "Where there are no users" do
    it "gets an empty array" do
      get users_path
      expect(json).to eq []
    end 
  end

  context "When there are users" do
    let(:user1) { User.create user_name: "Juanito Profundo", user_email: "scissorshands@gmail.com", confirmed: true }
    let(:user2) { User.create user_name: "Angelita Guapita", user_email: "tomraider@gmail.com", confirmed: true }
    let!(:users) { [user1.to_h, user2.to_h] }

    it "gets a collection of users" do
      get users_path
      expect(json.size).to eq 2
    end
    
    it 'gets all the users' do
      get users_path
      expect(json).to match_array users
    end

  end

  context "Creating a user" do
    before {post users_path, user_params}

      it 'creates a user' do
        expect(User.count).to eq 1
      end

      it 'creates a user' do
        expect(status).to eq 201
       end

    end

  private
  def user_params(args = {})
    {
        user_name: "Juanito Alimaña",
        user_email: "ruben@gmail.com",
        confirmed: true

    }.merge(args)
  end

end