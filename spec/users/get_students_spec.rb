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
    # Then my path should be "/search" with "house=slytherin" in the parameters
    # expect(current_path).to eq('/search?house=slytherin')
    # And I should see a message "22 Students"
    expect(page).to have_content("22 Students")
    # And I should see a list of the 22 members of Slytherin
    expect(page).to have_css('.members')
    expect(page).to have_css('.single_student', count: 22)
    # And I should see a name and id for each student.
    within(first(".single_student")) do
      expect(page).to have_css(".id")
      expect(page).to have_css(".name")
    end
  end
end


# You are the new web developer for Hogwarts. The IT staff has provided an API where you can get a listing of students. 

# `http://hogwarts-it.herokuapp.com`

# You are to create an app and complete this following user story:

# ```
# As a user
# When I visit "/"
# And I select "Slytherin" from the dropdown
# And I click on "Get Students"
# Then my path should be "/search" with "house=slytherin" in the parameters
# And I should see a message "22 Students"
# And I should see a list of the 22 members of Slytherin
# And I should see a name and id for each student.
# ```


# Your key is: alohamora