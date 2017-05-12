require 'rails_helper'

describe MessagesController do
  before do
    sign_in user
  end

  after do
    sign_out user
  end

  let(:user) { create(:user) }
  let(:group) { create(:group, users: [user]) }
  let(:messages){create_list(:message, 3, user: user, group: group)}
  describe "GET #index" do
    before do
      get :index, params: { group_id: group.id }
      # 上記はパスを送っていると考える。
    end
      it "renders the :index template" do
        expect(response).to render_template :index
      end

      it "assigns an array of messages" do
        expect(assigns(:messages)).to match(messages)
      end
    end

  describe "POST #create" do
    context "with valid params" do
      it "redirects to the group_messages_path" do
        post :create, params: { group_id: group.id, message: { body: "body desu" } }
        expect(response).to redirect_to(group_messages_path(group))
      end

      it"creates a new Message" do
        expect {
          post :create, params: { group_id: group.id, message: { body: "body desu" } }
        }.to change(Message, :count).by(1)
      end
    end
    context "with invalid params" do
      it "returns a success response" do
        post :create, params: {group_id: group.id, message: { body: "" }}
        expect(response).to be_success
      end
      it "renders the :index template" do
      get :index, params: { group_id: group.id, message: {body: ""} }
      expect(response).to render_template :index
      end
    end

  end
end
