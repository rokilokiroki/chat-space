require 'rails_helper'

describe MessagesController do

  describe 'POST #create' do
    it "renders the :index template" do
       post :create(:message)
       post :create, id:
       expect(assigns(:message)).to eq message
    end
  end
  describe 'GET #index' do
    it "assigns the requested tweet to @tweet" do
      message = create_list(:message, 3)
      get :index, id: message
      expect(assigns(:message)).to eq message
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
