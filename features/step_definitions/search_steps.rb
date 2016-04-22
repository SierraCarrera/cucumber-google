require 'watir-webdriver'
browser = Watir::Browser.new

When(/^I go to Google$/) do
	browser.goto 'www.google.com'
	sleep 5
end

Then(/^I search for a term$/) do
    search_field = browser.text_field(id: 'lst-ib')
	search_field.flash
	search_field.set('darn tough socks')
	search_field.send_keys(:enter)
	sleep 5
end

Then(/^I want that term in all the titles$/) do
	results = browser.h3s(class: 'r')
	results.each do |title|
		expect(title.text).to include 'darn tough socks'
	end
end