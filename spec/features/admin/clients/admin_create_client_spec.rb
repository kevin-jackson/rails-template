require 'rails_helper'

feature 'Admin can create a new Client' do

  signed_in_as(:admin) do
    before do
      click_header_option("Dashboard")
      click_sidemenu_option("Clients")
      click_link("Add new client")
    end

    scenario 'Admin creates client with valid data' do
      fill_in("Name", with: "Valid client name")
      click_button("Create")

      # Current client should be redirected to the index
      expect(current_path).to eq(admin_clients_path)

      # User should be saved
      latest_client = Client.find_by(name: "Valid client name")
      expect(latest_client).to be_present
    end

    scenario 'Admin creates client with invalid data' do
      fill_in("Name", with: "")
      click_button("Create")

      # Ensure no client is created
      expect(page).to have_error_message("client_name", "can't be blank")
      expect(Client.count).to eq(0)
    end
  end
end
