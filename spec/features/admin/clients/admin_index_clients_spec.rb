require 'rails_helper'

feature 'Admin can view an index of clients' do
	
  signed_in_as(:admin) do
    let!(:client) { FactoryGirl.create(:client) }

    before do
      click_header_option("Dashboard")
      click_sidemenu_option("Clients")
    end

    scenario "Showing clients" do
      expect(page).to have_content(client.name)
    end
  end

end