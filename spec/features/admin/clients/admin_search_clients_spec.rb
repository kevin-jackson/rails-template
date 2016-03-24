require 'rails_helper'

feature 'Admin can search for clients by name' do
  
  signed_in_as(:admin) do
    let!(:matching_client) { FactoryGirl.create(:client) }

    before do
      click_header_option("Dashboard")
      click_sidemenu_option("Clients")
    end

    scenario "Search with matching data" do
      expect(page).to have_content(matching_client.name)

      fill_in('Search by name', with: matching_client.name)
      click_button('Search')

      expect(page).to have_content(matching_client.name)
    end

    scenario "Search with non-matching data" do
      fill_in('Search by name', with: "Test client")
      click_button('Search')

      expect(page).to have_content("No users matched your search")
    end
  end

end