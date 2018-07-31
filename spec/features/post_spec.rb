require "rails_helper"
require "spec_helper"

RSpec.describe "Post feature", type: :feature, js: true do
  feature "view new post page" do
    scenario "user should see the created cards" do
      visit new_post_path
      expect(page).to have_content("Body")
      fill_in("post_title", with: 'Sample title')
      fill_in("post_body", with: 'Sample body')
      find('.btn.btn-primary').click
      expect(page).to have_content('Sample body')
      sleep 2
      all('.btn.btn-secondary')[2].click
      expect(page).to have_content('Delete')
      sleep 1
      accept_alert do
        find('.btn.btn-danger').click
        page.driver.browser.switch_to.alert.accept
      end
      sleep 2
      expect(page).not_to have_content('Sample body')
    end

  end
  feature "edit new post" do
    scenario "user should see the created cards" do
      visit new_post_path
      expect(page).to have_content("Body")
      fill_in("post_title", with: 'Sample title')
      fill_in("post_body", with: 'Sample body')
      find('.btn.btn-primary').click
      expect(page).to have_content('Sample body')
      all('.btn.btn-secondary')[2].click
      find('.btn.btn-secondary').click
      expect(page).to have_content("Body")
      expect(page).to have_content("Title")
      fill_in("post_title", with: 'Edited title')
      fill_in("post_body", with: 'Edited body')
      sleep 1
      find_button('Save Post').click
      expect(page).to have_content('Edited body')
      sleep 4
    end
  end
end