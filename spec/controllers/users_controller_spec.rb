require "rails_helper"

RSpec.describe UsersController, type: :controller do
  include SessionHelper
  let!(:user) { FactoryBot.create(:user) }
  let(:invalid_email) { FactoryBot.attributes_for(:user, email: "bjsadbjkasd") }
  before do
    log_in user
  end

  describe "GET #show" do
    it "reder user" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    before do
      get :new
    end
  end

  describe "POST create" do
    context "create a new user success" do
      it "create a new user" do
        expect {
          post :create,
               params: { user: FactoryBot.attributes_for(:user) }
        }.to change(User, :count).by(1)
      end

      it "flash success message" do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(flash[:info]).to eq(I18n.t "message.check_mail")
      end

      it "redirects to the root" do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to redirect_to(root_path)
      end
    end

    context "create a new user failed" do
      it "create a new user failed" do
        expect {
          post :create,
               params: { user: invalid_email }
        }.to change(User, :count).by(0)
      end

      it "render to :new" do
        post :create, params: { user: invalid_email }
        expect(response).to render_template :new
      end
    end

    describe "PUT #update" do
      before :each do
        @user = FactoryBot.create(:user, name: "oldName")
      end
      context "update the user success" do
        it "located the requested @user" do
          put :update, params: {id: @user, user: FactoryBot.attributes_for(:user, name: "asd")}
          expect(assigns(:user)).to eq(@user)      
        end

        it "changes user attributes" do
          put :update, params: {id: @user, user: FactoryBot.attributes_for(:user, name: "newName")}
          @user.reload
          expect(@user.name).to eq("newName") 
        end

        it "flash success message" do
          put :update, params: {id: @user, user: FactoryBot.attributes_for(:user, name: "newName")}
          expect(flash[:success]).to eq(I18n.t "message.update_success")
        end
      end

      context "invalid attributes" do
        it "located the requested @user" do
          put :update, params: {id: @user, user: FactoryBot.attributes_for(:user, email: "hjbfsd")}
          expect(assigns(:user)).to eq(@user)
        end
  
        it "does not changes @user attributes" do
          put :update, params: {id: @user, user: FactoryBot.attributes_for(:user, email: "hjbfsd")}
          @user.reload
          expect(@user.email).not_to eq("hjbfsd")
        end
  
        it "re-renders the edit method" do
          put :update, params: {id: @user, user: FactoryBot.attributes_for(:user, email: "hjbfsd")}
          expect(response).to render_template :edit
        end
      end
    end
  end
end
