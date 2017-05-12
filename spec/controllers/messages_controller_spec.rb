require 'rails_helper'

describe MessagesController do

  after do
    sign_out user
  end

  let(:user) { create(:user) }
  let(:group) { create(:group, users: [user]) }
  let(:messages){create_list(:message, 3, user: user, group: group)}

  describe "GET #index" do
    context "login.ver" do
      before do
        sign_in user
      end
        it "renders the :index template" do
          get :index, params: { group_id: group.id }
          expect(response).to render_template :index
        end

        it "assigns an array of messages" do
          get :index, params: { group_id: group.id }
          expect(assigns(:messages)).to match(messages)
        end
    end
    context "not login var" do
      it "redirect_to(new_user_session_path)" do
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST #create" do
    before do
      sign_in user
    end
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
