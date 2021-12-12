require './features/pages/MainMenu.rb'
require './features/pages/BusinessPage.rb'
$business = -1

Given('I push {string} in left side menus') do |string|
    menu = MainMenu.new(page)
    $business = menu.click_in_menu(string)
end


When('I push the filter') do
    sleep 2
    $business.push_the_filter()
end

When('I push the {string} section') do |string|
    sleep 1
    puts("1") 
    $business.push_section(string)
    puts("2") 
end

When('I push the {string} option of {string} section') do |string,sec|
    sleep 1
    $business.push_option(string, sec)
end

When('I deselect the filter selected') do
    $business.deselect_filter_selected()
end

When('I deselect all filters') do
    $business.deselect_all_filters_selected()
end

Then('I should see a table with only {string} in {string} column') do |value,column|
    request = $business.all_values_column_are_equal(value, column)
    expect(request).to be true
end

Then('I should see the buttons {string} in {string} column with the value {string}') do |name_button,column, value|
    request = $business.all_modules_are_equal(name_button,column, value)
    expect(request).to be true
end

Then('I should not see {string} filtered section') do |filter|
    request = $business.page_mark_the_filter(filter)
    expect(request).to be false
end