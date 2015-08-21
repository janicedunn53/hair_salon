require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to main page', {:type => :feature}) do
  it("loads the homepage") do
    visit("/")
    expect(page).to have_content("Hair Salon Database")
  end
end

describe('adding a new stylist', {:type => :feature}) do
  it('allows the user to add a stylist') do
    stylist = Stylist.new({:name => "Julie", :id => nil})
    stylist.save()
    visit("/")
    fill_in('name', :with => "Julie")
    click_button("Add stylist")
    expect(page).to have_content("Hair Salon Database")
  end
end

describe('seeing clients of stylist', :type => :feature) do
  it("displays all clients for stylist") do
     stylist = Stylist.new({:name => "Julie", :id => nil})
     stylist.save()
     client = Client.new({:description => "Jeff_haircut", :stylist_id => 1})
     client.save()
     visit("/")
     click_link("Julie")
     expect(page).to have_content("Julie")
   end
 end

# describe('adding a client to a particular stylist', {:type => :feature}) do
#   it('allows a user to select a stylist and add a client') do
#     stylist = Stylist.new({:name => "Julie", :id => nil})
#     stylist.save()
#     client = Client.new({:description => "Jeff_haircut", :stylist_id => 1})
#     client.save()
#     visit("/")
#     select("Julie", :from => 'Select a stylist')
#     fill_in('description', => :with "Jeff_haircut")
#     click_button("Add client")
#     expect(page).to have_content("Hair Salon Database")
#   end
# end
