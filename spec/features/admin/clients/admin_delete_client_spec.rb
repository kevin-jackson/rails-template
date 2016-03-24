require 'rails_helper'

feature 'Admin can delete an existing client' do

  signed_in_as(:admin) do
    let!(:target_client) { FactoryGirl.create(:client, name: "Test Client") }

    before do
      click_header_option("Dashboard")
      click_sidemenu_option("Clients")
    end

    scenario 'Admin can delete client' do
      within_row(target_client.name) do
        click_link("Delete")
      end

      # User should be deleted
      client = Client.find_by(name: target_client.name)
      expect(client).not_to be_present
      expect(page).to have_flash(:notice, "'Test Client' deleted")
    end
  end
  
end