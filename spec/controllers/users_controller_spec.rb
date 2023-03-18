RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) { attributes_for(:user, address_attributes: attributes_for(:address)) }

      it "creates a new user" do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it "redirects to the users index page" do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(users_path)
      end

      it "sends a welcome email to the user" do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change { ActionMailer::Base.deliveries.count }.by(1)

        expect(ActionMailer::Base.deliveries.last.to).to eq([valid_attributes[:email]])
        expect(ActionMailer::Base.deliveries.last.subject).to eq("Bem vindo ao site")
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { attributes_for(:user, full_name: nil) }

      it "does not create a new user" do
        expect do
          post :create, params: { user: invalid_attributes }
        end.not_to change(User, :count)
      end
    end
  end
end
