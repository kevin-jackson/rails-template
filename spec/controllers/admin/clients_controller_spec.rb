require 'rails_helper'

RSpec.describe Admin::ClientsController, type: :controller do

  describe "GET index" do
    subject(:get_index) { get :index }

    authenticated_as(:admin) do
      it { should be_success }
    end

    it_behaves_like "action requiring authentication"
    it_behaves_like "action authorizes roles", [:admin]
  end

  describe "GET new" do
    subject(:get_new) { get :new }

    authenticated_as(:admin) do
      it { should be_success }
    end

    it_behaves_like "action requiring authentication"
    it_behaves_like "action authorizes roles", [:admin]
  end

  describe 'POST create' do
    subject(:create_client) { post :create, client: params }
    # Provide some fake parameters so the authorization checks doesn't cause
    # params.require to raise an exception
    let(:params) { {id: 666} }

    authenticated_as(:admin) do

      context "with valid parameters" do
        let(:params) do
          {
            name: "email@example.com"
          }
        end

        it "creates a Client object with the given attributes" do
          create_client

          client = Client.find_by(name: params[:name])
          expect(client).to be_present
        end

        it { should redirect_to(admin_clients_path) }
      end

      context "with invalid parameters" do
        let(:params) { { name: nil } }
        specify { expect { subject }.not_to change(Client, :count) }
      end
    end

    it_behaves_like "action requiring authentication"
    it_behaves_like "action authorizes roles", [:admin]
  end

  describe 'GET edit' do
    subject { get :edit, id: target_client.id }
    let(:target_client) { FactoryGirl.create(:client) }

    authenticated_as(:admin) do
      it { should be_success }
    end

    it_behaves_like "action requiring authentication"
    it_behaves_like "action authorizes roles", [:admin]
  end

  describe 'POST update' do
    subject(:update_client) { post :update, id: target_client.id, client: params }
    let(:params) { { id: 666 } }
    let(:target_client) { FactoryGirl.create(:client) }

    authenticated_as(:admin) do

      context "with valid parameters" do
        let(:params) do
          {
            name: "Test client update"
          }
        end

        it "creates a User object with the given attributes" do
          update_client

          target_client.reload
          expect(target_client.name).to eq("Test client update")
        end

        it { should redirect_to(admin_clients_path) }
      end

      context "with invalid parameters" do
        let(:params) { { name: nil } }

        it "doesn't update the User" do
          update_client
          expect(target_client.reload.name).not_to eq(params[:name])
        end
      end
    end

    it_behaves_like "action requiring authentication"
    it_behaves_like "action authorizes roles", [:admin]
  end

  describe 'POST destroy' do
    subject { delete :destroy, id: target_client.id }
    let(:target_client) { FactoryGirl.create(:client) }

    authenticated_as(:admin) do
      it "deletes the user" do
        subject

        client = Client.find_by(name: target_client.name)
        expect(client).not_to be_present
      end
      it { should redirect_to(admin_clients_path) }
    end

    it_behaves_like "action requiring authentication"
    it_behaves_like "action authorizes roles", [:admin]
  end

end
