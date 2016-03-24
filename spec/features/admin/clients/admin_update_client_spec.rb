require 'rails_helper'

feature 'Admin can update an existing client' do

	signed_in_as(:admin) do
		let!(:target_client) { FactoryGirl.create(:client, name: "Test Client") }

    before do
      click_header_option("Dashboard")
      click_sidemenu_option("Clients")
      within_row(target_client.name) do
        click_link("Edit")
      end
    end

		scenario 'Admin updates client with valid data' do
      fill_in("Name", with: "Test Client Updated")
      click_button("Save Changes")

      # Current client should be redirected to the index
      expect(current_path).to eq(admin_clients_path)

      # Client should be saved
      expect(target_client.reload.name).to eq("Test Client Updated")
		end

    scenario 'Admin updates client with invalid data' do
      fill_in("Name", with: "")
      click_button("Save Changes")

      # Ensure client is not updated
      expect(target_client.reload.name).to eq("Test Client")
      expect(page).to have_error_message("client_name", "can't be blank")
    end
	end
  
end