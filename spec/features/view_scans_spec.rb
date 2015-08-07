require "spec_helper"

feature "view scans" do
  scenario "index" do
    scans = create_list(:scan, 50)
    visit "/"
    expect(page).to have_content(scans.last.content)
    expect(page).to_not have_content(scans.first.content)
  end
end
