require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      user = User.create(username: 'a', password: 'abcdef')
      get :show, params: {id: user.id}
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #create" do
  context "with invalid params" do
    it "validates the presence of the user's username and password" do
      post :create, params: { user: { username: "jack_bruce", password: "" } }
      expect(response).to render_template("new")
      expect(flash[:errors]).to be_present
    end

    it "validates that the password is at least 6 characters long" do
      post :create, params: { user: { username: "jack_bruce", password: "short" } }
      expect(response).to render_template("new")
      expect(flash[:errors]).to be_present
    end
  end

  # context "with valid params" do
  #   it "redirects user to sign-in page on success" do
  #     user = User.create(username: 'jack_bruce', password: 'password')
  #     post :create, params: { user: { username: "jack_bruce", password: "password" } }
  #     expect(response).to redirect_to(user_url(user.id))
  #   end
  # end
end
  
  

end
