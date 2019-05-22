require 'rails_helper'

RSpec.describe 'as a user on the root path' do
  it 'can search for students by house' do
    # As a user
    # When I visit "/"
    visit "/"
    # And I select "Slytherin" from the dropdown
    select "Slytherin", :from => "house"
    # And I click on "Get Students"
    click_on 'Get Students'
    save_and_open_page

    # Then my path should be "/search" with "house=slytherin" in the parameters
    # expect(current_path).to eq('/search?house=slytherin')
    # And I should see a message "22 Students" 3?
    # expect(page).to have_content("3 Students")
    # And I should see a list of the 22 members of Slytherin, 3?
    # expect(page).to have_css('.members', count: 3)
    # And I should see a name and id for each student
    within first('.members') do
      # expect(page).to have_css(".id")
      expect(page).to have_css(".name")
    end
  end
end