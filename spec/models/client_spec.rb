require 'rails_helper'

RSpec.describe Client, type: :model do
  
  describe '@name' do
    let!(:client)    { FactoryGirl.create(:client) }
    let(:new_client) { FactoryGirl.build(:client, name: client.name) }

    it { should validate_presence_of(:name) }

    it "validates uniqueness with other clients" do
      expect(new_client).to be_invalid
      expect(new_client.errors[:name]).to be_present
    end

    it "doesn't validate uniqueness with deleted clients" do
      client.destroy
      expect(new_client).to be_valid
    end

    it "doesn't validate uniqueness of name when both clients are deleted" do
      client.destroy
      new_client.save!
      expect(new_client).to be_valid
    end
  end

  describe "client search by name" do
    subject { Client.name_search("Test") }

    it { should include(FactoryGirl.create(:client, name: "Test Client")) }
    it { should include(FactoryGirl.create(:client, name: "TeST")) }
    it { should include(FactoryGirl.create(:client, name: "ClientTest")) }
    it { should_not include(FactoryGirl.create(:client, name: "Client")) }
  end

  describe '#to_s' do
    specify { expect(Client.new(name: "Client").to_s).to eq("Client") }
  end

end
